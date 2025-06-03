part of 'audio_player_cubit.dart';

class AudioPlayerState extends Equatable {
  final bool isPlaying;
  final PlayerState playerState;
  final LoopMode loopMode;
  final List<AudioTag> playlist;
  final AudioTag? currentAudioTag;
  final int currentIndex;
  final Duration position;
  final Duration duration;

  const AudioPlayerState({
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.playerState,
    required this.loopMode,
    required this.playlist,
    required this.currentIndex,
    this.currentAudioTag,
  });

  factory AudioPlayerState.initial() => AudioPlayerState(
    isPlaying: false,
    position: Duration.zero,
    duration: Duration.zero,
    playerState: PlayerState(false, ProcessingState.idle),
    loopMode: LoopMode.off,
    currentIndex: 0,
    playlist: [],
  );

  AudioPlayerState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    PlayerState? playerState,
    LoopMode? loopMode,
    List<AudioTag>? playlist,
    int? currentIndex,
    AudioTag? currentAudioTag,
    bool removeAudio = false,
  }) {
    return AudioPlayerState(
      playlist: playlist ?? this.playlist,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      playerState: playerState ?? this.playerState,
      loopMode: loopMode ?? this.loopMode,
      currentIndex: removeAudio ? 0 : currentIndex ?? this.currentIndex,
      currentAudioTag: removeAudio ? null : (currentAudioTag ?? this.currentAudioTag),
    );
  }

  @override
  List<Object?> get props => [
    isPlaying,
    position,
    duration,
    currentAudioTag,
    loopMode,
    playlist,
    currentIndex,
  ];
}
