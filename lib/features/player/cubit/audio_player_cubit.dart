import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

part 'audio_player_state.dart';

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
  }
  void _setInitialPlaylist() async {
    const prefix = 'https://www.soundhelix.com/examples/mp3';
    final song1 = Uri.parse('$prefix/SoundHelix-Song-1.mp3');
    final song2 = Uri.parse('$prefix/SoundHelix-Song-2.mp3');
    final song3 = Uri.parse('$prefix/SoundHelix-Song-3.mp3');
    _player.setAudioSources([
      AudioSource.uri(song1, tag: 'Song 1'),
      AudioSource.uri(song2, tag: 'Song 2'),
      AudioSource.uri(song3, tag: 'Song 3'),
    ]);
  }

  Future<void> setUrlAudio(String url) async {
    _player.stop();
    _setInitialPlaylist();
    emit(state.copyWith(removeAudio: true));
    _player.play();
  }

  Future<void> next() async {
    await _player.seekToNext();
  }

  Future<void> prev() async {
    await _player.seekToPrevious();
  }

  Future<void> setAudioFile(SongModel newAudio, {bool shouldPlay = true}) async {
    if (_player.playing) {
      await _player.stop();
    }
    await _player.setFilePath(newAudio.data);
    emit(state.copyWith(audio: newAudio));
    if (shouldPlay) {
      await _player.play();
    }
  }

  void pause() => _player.pause();
  void play() => _player.play();
  void seek(Duration position) => _player.seek(position);
  void toggle() => state.isPlaying ? pause() : _player.play();
  void toggleRepeatMode() => _player.setLoopMode(nextLoopMode(_player.loopMode));

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

  // @override
  // void onChange(Change<AudioPlayerState> change) {
  //   // TODO: implement onChange
  //   super.onChange(change);
  //   print('xxxxxxxxxxxx audio_player_cubit xxxxxxxxxxxxxxx');
  //   print(change.nextState.loopMode);
  //   print('xxxxxxxxxxxx audio_player_cubit xxxxxxxxxxxxxxx');
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
