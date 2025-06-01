import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayerCubit() : super(AudioPlayerState.initial()) {
    _player.positionStream.listen((pos) {
      emit(state.copyWith(position: pos));
    });

    _player.durationStream.listen((dur) {
      emit(state.copyWith(duration: dur ?? Duration.zero));
    });

    _player.playerStateStream.listen((playerState) {
      // isPlaying: playerState.playing && playerState.processingState == ProcessingState.ready,
      emit(state.copyWith(isPlaying: playerState.playing));

      if (playerState.processingState == ProcessingState.completed) {
        _player.stop();
        _player.seek(Duration.zero);
      }
    });
  }

  Future<void> setUrlAudio(String url) async {
    await _player.setUrl(url);
    _player.play();
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
  void toggle() {
    state.isPlaying ? pause() : _player.play();
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

}

// class AudioManager {
//   static final AudioManager _instance = AudioManager._internal();
//   factory AudioManager() => _instance;

//   final AudioPlayer player = AudioPlayer();

//   AudioManager._internal();
// }
