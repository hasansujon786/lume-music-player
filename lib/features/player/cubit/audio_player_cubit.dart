import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../models/audio_tag.dart';

part 'audio_player_cubit.freezed.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _player = AudioPlayerManager().player;

  AudioPlayerCubit() : super(AudioPlayerState.initial()) {
    _player.loopModeStream.listen((mode) {
      emit(state.copyWith(loopMode: mode));
    });

    _player.positionStream.listen((pos) {
      emit(state.copyWith(position: pos));
    });

    _player.durationStream.listen((dur) {
      emit(state.copyWith(duration: dur ?? Duration.zero));
    });

    _player.playerStateStream.listen((playerState) {
      emit(state.copyWith(isPlaying: playerState.playing, playerState: playerState));

      if (playerState.processingState == ProcessingState.completed) {
        _player.stop();
        _player.seek(Duration.zero, index: _player.effectiveIndices.first);
      }
    });

    _listenForChangesInSequenceState();
  }

  Future<void> setAudioFromFile(
    List<SongModel> audioFiles, {
    bool shouldPlay = true,
    int? index,
  }) async {
    final sources = audioFiles
        .map((song) => AudioSource.file(song.data, tag: AudioTag.fromSongModel(song)))
        .toList();

    await _player.setAudioSources(sources);
    if (index != null) {
      await selectAudioWithIndex(index);
    }
    if (shouldPlay && !_player.playing) {
      await _player.play();
    }
  }

  void pause() => _player.pause();
  void play() => _player.play();
  void seek(Duration position) => _player.seek(position);
  void toggle() => state.isPlaying ? pause() : _player.play();
  void toggleRepeatMode() => _player.setLoopMode(nextLoopMode(_player.loopMode));
  Future<void> toggleShuffle() async {
    final current = _player.shuffleModeEnabled;
    await _player.setShuffleModeEnabled(!current);
  }

  Future<void> next() async {
    if (_player.hasNext) await _player.seekToNext();
  }

  Future<void> prev() async {
    if (_player.hasPrevious) await _player.seekToPrevious();
  }

  Future<void> selectAudioWithIndex(int index) async {
    await _player.seek(Duration.zero, index: index);
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

  List<int> get shuffleIndices {
    return _player.sequenceState.shuffleIndices;
  }

  void _listenForChangesInSequenceState() {
    _player.sequenceStateStream.listen((sequenceState) {
      final currentItem = sequenceState.currentSource;
      // update playlist
      final playlist = sequenceState.effectiveSequence;
      final tags = playlist.map((item) => item.tag as AudioTag).toList();

      // Update the index of the currently playing song
      // based on the effective playlist order (shuffled or not),
      int? currentSequenceIndex;
      if (_player.shuffleModeEnabled) {
        final sequenceState = _player.sequenceState;

        final effectiveSequence = sequenceState.effectiveSequence;
        final currentSource = sequenceState.currentSource;

        if (currentSource != null) {
          currentSequenceIndex = effectiveSequence.indexOf(currentSource);
        }
      } else {
        currentSequenceIndex = sequenceState.currentIndex;
      }

      emit(
        state.copyWith(
          playlist: tags,
          currentIndex: sequenceState.currentIndex,
          currentSequenceIndex: currentSequenceIndex,
          currentAudioTag: currentItem?.tag,
          shuffleModeEnabled: sequenceState.shuffleModeEnabled,
          duration: currentItem?.duration ?? Duration.zero,
        ),
      );

      // // update previous and next buttons
      // if (playlist.isEmpty || currentItem == null) {
      //   isFirstSongNotifier.value = true;
      //   isLastSongNotifier.value = true;
      // } else {
      //   isFirstSongNotifier.value = playlist.first == currentItem;
      //   isLastSongNotifier.value = playlist.last == currentItem;
      // }
    });
  }

  // @override
  // void onChange(Change<AudioPlayerState> change) {
  //   // TODO: implement onChange
  //   super.onChange(change);
  //   print('xxxxxxxxxxxx audio_player_cubit xxxxxxxxxxxxxxx');
  //   print(change.nextState.loopMode);
  //   print('xxxxxxxxxxxx audio_player_cubit xxxxxxxxxxxxxxx');
  // }

  // void _setInitialPlaylist() async {
  //   const prefix = 'https://www.soundhelix.com/examples/mp3';
  //   final song1 = Uri.parse('$prefix/SoundHelix-Song-1.mp3');
  //   final song2 = Uri.parse('$prefix/SoundHelix-Song-2.mp3');
  //   final song3 = Uri.parse('$prefix/SoundHelix-Song-3.mp3');
  //   _player.setAudioSources([
  //     AudioSource.uri(song1, tag: 'Song 1'),
  //     AudioSource.uri(song2, tag: 'Song 2'),
  //     AudioSource.uri(song3, tag: 'Song 3'),
  //   ]);
  // }
  // Future<void> setUrlAudio(String url) async {
  //   _player.stop();
  //   _setInitialPlaylist();
  //   // emit(state.copyWith(removeAudio: true));
  //   _player.play();
  // }
}

class AudioPlayerManager {
  // Static instance (singleton)
  static final AudioPlayerManager _instance = AudioPlayerManager._internal();
  factory AudioPlayerManager() => _instance;
  AudioPlayerManager._internal();

  // Public fields
  final AudioPlayer player = AudioPlayer();
}

LoopMode nextLoopMode(LoopMode value) {
  final next = (value.index + 1) % LoopMode.values.length;
  return LoopMode.values[next];
}

@freezed
abstract class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    Duration? position,
    Duration? duration,
    required bool isPlaying,
    required PlayerState playerState,
    required LoopMode loopMode,
    required bool shuffleModeEnabled,
    required List<AudioTag> playlist,
    int? currentIndex,
    int? currentSequenceIndex,
    AudioTag? currentAudioTag,
  }) = _AudioPlayerState;

  const AudioPlayerState._(); // TODO: I need to larn _() call

  factory AudioPlayerState.initial() => AudioPlayerState(
    isPlaying: false,
    position: Duration.zero,
    duration: Duration.zero,
    playerState: PlayerState(false, ProcessingState.idle),
    loopMode: LoopMode.off,
    shuffleModeEnabled: false,
    currentIndex: 0,
    playlist: [],
  );
}
