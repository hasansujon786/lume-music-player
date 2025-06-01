part of 'audio_player_cubit.dart';

class AudioPlayerState extends Equatable {
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final SongModel? audio;

  const AudioPlayerState({
    required this.isPlaying,
    required this.position,
    required this.duration,
    this.audio,
  });

  factory AudioPlayerState.initial() =>
      const AudioPlayerState(isPlaying: false, position: Duration.zero, duration: Duration.zero);

  AudioPlayerState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    SongModel? audio,
  }) {
    return AudioPlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      audio: audio ?? this.audio,
    );
  }

  @override
  List<Object?> get props => [isPlaying, position, duration, audio];
}
