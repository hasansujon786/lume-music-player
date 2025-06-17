import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

// Class for handling audio playback using AudioService and Just Audio
class AudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final AudioPlayer audioPlayer = AudioPlayer();

  UriAudioSource _createAudioSource(MediaItem item) {
    return ProgressiveAudioSource(Uri.parse(item.id));
  }

  // Listen for changes in the current song index and update the media item
  void _listenForCurrentSongIndexChanges() {
    audioPlayer.currentIndexStream.listen((index) {
      final playlist = queue.value;
      if (index == null || playlist.isEmpty) return;
      mediaItem.add(playlist[index]);
    });
  }

  // Broadcast the current playback state based on the received PlaybackEvent
  void _broadcastState(PlaybackEvent event) {
    playbackState.add(
      playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (audioPlayer.playing) MediaControl.pause else MediaControl.play,
          MediaControl.skipToNext,
        ],
        systemActions: {MediaAction.seek, MediaAction.seekForward, MediaAction.seekBackward},
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[audioPlayer.processingState]!,
        playing: audioPlayer.playing,
        updatePosition: audioPlayer.position,
        bufferedPosition: audioPlayer.bufferedPosition,
        speed: audioPlayer.speed,
        queueIndex: event.currentIndex,
      ),
    );
  }

  // Function to initialize the songs and set up the audio player
  Future<void> initSongs({required List<MediaItem> songs}) async {
    // Listen for playback events and broadcast the state
    audioPlayer.playbackEventStream.listen(_broadcastState);

    // Create a list of audio sources from the provided songs
    final audioSource = songs.map(_createAudioSource).toList();

    // Set the audio source of the audio player to the concatenation of the audio sources
    // await audioPlayer.setAudioSource(ConcatenatingAudioSource(children: audioSource));
    await audioPlayer.setAudioSources(audioSource);

    // Add the songs to the queue
    queue.value.clear();
    queue.value.addAll(songs);
    queue.add(queue.value);

    // Listen for changes in the current song index
    _listenForCurrentSongIndexChanges();

    // Listen for processing state changes and skip to the next song when completed
    audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) skipToNext();
    });
  }

  // Play function to start playback
  @override
  Future<void> play() => audioPlayer.play();

  // Pause function to pause playback
  @override
  Future<void> pause() => audioPlayer.pause();

  // Seek function to change the playback position
  @override
  Future<void> seek(Duration position) => audioPlayer.seek(position);

  // Skip to a specific item in the queue and start playback
  @override
  Future<void> skipToQueueItem(int index) async {
    await audioPlayer.seek(Duration.zero, index: index);
    play();
  }

  // Skip to the next item in the queue
  @override
  Future<void> skipToNext() => audioPlayer.seekToNext();

  // Skip to the previous item in the queue
  @override
  Future<void> skipToPrevious() => audioPlayer.seekToPrevious();
}

// Convert a SongModel to a MediaItem
Future<MediaItem> songToMediaItem(SongModel song) async {
  try {
    // Get the artwork for the song
    final Uri? artUri = await getSongArt(
      id: song.id,
      type: ArtworkType.AUDIO,
      quality: 100,
      size: 300,
    );

    return MediaItem(
      // Use the song URI as the MediaItem ID
      id: song.uri.toString(),

      // Set the artwork URI obtained earlier
      artUri: artUri,

      // Format the song title using the provided utility function
      title: song.title,
      // title: formattedTitle(song.title).trim(),

      artist: song.artist,
      duration: Duration(milliseconds: song.duration!),
      displayDescription: song.id.toString(),
    );
  } catch (e) {
    // Handle any errors that occur during the process
    debugPrint('Error converting SongModel to MediaItem: $e');
    // Return a default or null MediaItem in case of an error
    return const MediaItem(id: '', title: 'Error', artist: 'Unknown');
  }
}

// Asynchronous function to get the artwork for a song
Future<Uri?> getSongArt({
  required int id,
  required ArtworkType type,
  required int quality,
  required int size,
}) async {
  try {
    final OnAudioQuery onAudioQuery = OnAudioQuery();

    // Query artwork data for the specified song
    final Uint8List? data = await onAudioQuery.queryArtwork(
      id,
      type,
      quality: quality,
      format: ArtworkFormat.JPEG,
      size: size,
    );

    Uri? artUri;

    if (data != null) {
      // Create a temporary directory to store the artwork file
      final Directory tempDir = Directory.systemTemp;

      // Create a file in the temporary directory with the song's id as the filename
      final File file = File('${tempDir.path}/$id.jpg');

      // Write the artwork data to the file
      await file.writeAsBytes(data);

      // Set the artwork variable to the Uri of the created file
      artUri = file.uri;
    }

    // Return the artwork's Uri
    return artUri;
  } catch (e) {
    // Handle any errors that occur during the process
    debugPrint('Error fetching song artwork: $e');
    return null; // Return null in case of error
  }
}
