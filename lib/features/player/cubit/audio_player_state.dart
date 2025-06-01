part of 'audio_player_cubit.dart';

class AudioPlayerState extends Equatable {
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final SongModel? audio;
  final PlayerState playerState;
  final LoopMode loopMode;

  const AudioPlayerState({
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.playerState,
    required this.loopMode,
    this.audio,
  });

  factory AudioPlayerState.initial() => AudioPlayerState(
    isPlaying: false,
    position: Duration.zero,
    duration: Duration.zero,
    playerState: PlayerState(false, ProcessingState.idle),
    loopMode: LoopMode.off,
  );

  AudioPlayerState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    PlayerState? playerState,
    LoopMode? loopMode,
    SongModel? audio,
    bool removeAudio = false,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      playerState: playerState ?? this.playerState,
      loopMode: loopMode ?? this.loopMode,
      audio: removeAudio ? null : (audio ?? this.audio),
    );
  }

  @override
  List<Object?> get props => [isPlaying, position, duration, audio, loopMode];
}
