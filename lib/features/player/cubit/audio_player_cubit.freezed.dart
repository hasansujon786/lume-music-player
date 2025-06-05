// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioPlayerState {

 Duration? get position; Duration? get duration; bool get isPlaying; PlayerState get playerState; LoopMode get loopMode; bool get shuffleModeEnabled; List<AudioTag> get playlist; int? get currentIndex; int? get currentSequenceIndex; AudioTag? get currentAudioTag;
/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioPlayerStateCopyWith<AudioPlayerState> get copyWith => _$AudioPlayerStateCopyWithImpl<AudioPlayerState>(this as AudioPlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioPlayerState&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.playerState, playerState) || other.playerState == playerState)&&(identical(other.loopMode, loopMode) || other.loopMode == loopMode)&&(identical(other.shuffleModeEnabled, shuffleModeEnabled) || other.shuffleModeEnabled == shuffleModeEnabled)&&const DeepCollectionEquality().equals(other.playlist, playlist)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.currentSequenceIndex, currentSequenceIndex) || other.currentSequenceIndex == currentSequenceIndex)&&(identical(other.currentAudioTag, currentAudioTag) || other.currentAudioTag == currentAudioTag));
}


@override
int get hashCode => Object.hash(runtimeType,position,duration,isPlaying,playerState,loopMode,shuffleModeEnabled,const DeepCollectionEquality().hash(playlist),currentIndex,currentSequenceIndex,currentAudioTag);

@override
String toString() {
  return 'AudioPlayerState(position: $position, duration: $duration, isPlaying: $isPlaying, playerState: $playerState, loopMode: $loopMode, shuffleModeEnabled: $shuffleModeEnabled, playlist: $playlist, currentIndex: $currentIndex, currentSequenceIndex: $currentSequenceIndex, currentAudioTag: $currentAudioTag)';
}


}

/// @nodoc
abstract mixin class $AudioPlayerStateCopyWith<$Res>  {
  factory $AudioPlayerStateCopyWith(AudioPlayerState value, $Res Function(AudioPlayerState) _then) = _$AudioPlayerStateCopyWithImpl;
@useResult
$Res call({
 Duration? position, Duration? duration, bool isPlaying, PlayerState playerState, LoopMode loopMode, bool shuffleModeEnabled, List<AudioTag> playlist, int? currentIndex, int? currentSequenceIndex, AudioTag? currentAudioTag
});


$AudioTagCopyWith<$Res>? get currentAudioTag;

}
/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final AudioPlayerState _self;
  final $Res Function(AudioPlayerState) _then;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = freezed,Object? duration = freezed,Object? isPlaying = null,Object? playerState = null,Object? loopMode = null,Object? shuffleModeEnabled = null,Object? playlist = null,Object? currentIndex = freezed,Object? currentSequenceIndex = freezed,Object? currentAudioTag = freezed,}) {
  return _then(_self.copyWith(
position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,playerState: null == playerState ? _self.playerState : playerState // ignore: cast_nullable_to_non_nullable
as PlayerState,loopMode: null == loopMode ? _self.loopMode : loopMode // ignore: cast_nullable_to_non_nullable
as LoopMode,shuffleModeEnabled: null == shuffleModeEnabled ? _self.shuffleModeEnabled : shuffleModeEnabled // ignore: cast_nullable_to_non_nullable
as bool,playlist: null == playlist ? _self.playlist : playlist // ignore: cast_nullable_to_non_nullable
as List<AudioTag>,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,currentSequenceIndex: freezed == currentSequenceIndex ? _self.currentSequenceIndex : currentSequenceIndex // ignore: cast_nullable_to_non_nullable
as int?,currentAudioTag: freezed == currentAudioTag ? _self.currentAudioTag : currentAudioTag // ignore: cast_nullable_to_non_nullable
as AudioTag?,
  ));
}
/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioTagCopyWith<$Res>? get currentAudioTag {
    if (_self.currentAudioTag == null) {
    return null;
  }

  return $AudioTagCopyWith<$Res>(_self.currentAudioTag!, (value) {
    return _then(_self.copyWith(currentAudioTag: value));
  });
}
}


/// @nodoc


class _AudioPlayerState extends AudioPlayerState {
  const _AudioPlayerState({this.position, this.duration, required this.isPlaying, required this.playerState, required this.loopMode, required this.shuffleModeEnabled, required final  List<AudioTag> playlist, this.currentIndex, this.currentSequenceIndex, this.currentAudioTag}): _playlist = playlist,super._();
  

@override final  Duration? position;
@override final  Duration? duration;
@override final  bool isPlaying;
@override final  PlayerState playerState;
@override final  LoopMode loopMode;
@override final  bool shuffleModeEnabled;
 final  List<AudioTag> _playlist;
@override List<AudioTag> get playlist {
  if (_playlist is EqualUnmodifiableListView) return _playlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlist);
}

@override final  int? currentIndex;
@override final  int? currentSequenceIndex;
@override final  AudioTag? currentAudioTag;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioPlayerStateCopyWith<_AudioPlayerState> get copyWith => __$AudioPlayerStateCopyWithImpl<_AudioPlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioPlayerState&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.playerState, playerState) || other.playerState == playerState)&&(identical(other.loopMode, loopMode) || other.loopMode == loopMode)&&(identical(other.shuffleModeEnabled, shuffleModeEnabled) || other.shuffleModeEnabled == shuffleModeEnabled)&&const DeepCollectionEquality().equals(other._playlist, _playlist)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.currentSequenceIndex, currentSequenceIndex) || other.currentSequenceIndex == currentSequenceIndex)&&(identical(other.currentAudioTag, currentAudioTag) || other.currentAudioTag == currentAudioTag));
}


@override
int get hashCode => Object.hash(runtimeType,position,duration,isPlaying,playerState,loopMode,shuffleModeEnabled,const DeepCollectionEquality().hash(_playlist),currentIndex,currentSequenceIndex,currentAudioTag);

@override
String toString() {
  return 'AudioPlayerState(position: $position, duration: $duration, isPlaying: $isPlaying, playerState: $playerState, loopMode: $loopMode, shuffleModeEnabled: $shuffleModeEnabled, playlist: $playlist, currentIndex: $currentIndex, currentSequenceIndex: $currentSequenceIndex, currentAudioTag: $currentAudioTag)';
}


}

/// @nodoc
abstract mixin class _$AudioPlayerStateCopyWith<$Res> implements $AudioPlayerStateCopyWith<$Res> {
  factory _$AudioPlayerStateCopyWith(_AudioPlayerState value, $Res Function(_AudioPlayerState) _then) = __$AudioPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 Duration? position, Duration? duration, bool isPlaying, PlayerState playerState, LoopMode loopMode, bool shuffleModeEnabled, List<AudioTag> playlist, int? currentIndex, int? currentSequenceIndex, AudioTag? currentAudioTag
});


@override $AudioTagCopyWith<$Res>? get currentAudioTag;

}
/// @nodoc
class __$AudioPlayerStateCopyWithImpl<$Res>
    implements _$AudioPlayerStateCopyWith<$Res> {
  __$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final _AudioPlayerState _self;
  final $Res Function(_AudioPlayerState) _then;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = freezed,Object? duration = freezed,Object? isPlaying = null,Object? playerState = null,Object? loopMode = null,Object? shuffleModeEnabled = null,Object? playlist = null,Object? currentIndex = freezed,Object? currentSequenceIndex = freezed,Object? currentAudioTag = freezed,}) {
  return _then(_AudioPlayerState(
position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,playerState: null == playerState ? _self.playerState : playerState // ignore: cast_nullable_to_non_nullable
as PlayerState,loopMode: null == loopMode ? _self.loopMode : loopMode // ignore: cast_nullable_to_non_nullable
as LoopMode,shuffleModeEnabled: null == shuffleModeEnabled ? _self.shuffleModeEnabled : shuffleModeEnabled // ignore: cast_nullable_to_non_nullable
as bool,playlist: null == playlist ? _self._playlist : playlist // ignore: cast_nullable_to_non_nullable
as List<AudioTag>,currentIndex: freezed == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int?,currentSequenceIndex: freezed == currentSequenceIndex ? _self.currentSequenceIndex : currentSequenceIndex // ignore: cast_nullable_to_non_nullable
as int?,currentAudioTag: freezed == currentAudioTag ? _self.currentAudioTag : currentAudioTag // ignore: cast_nullable_to_non_nullable
as AudioTag?,
  ));
}

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AudioTagCopyWith<$Res>? get currentAudioTag {
    if (_self.currentAudioTag == null) {
    return null;
  }

  return $AudioTagCopyWith<$Res>(_self.currentAudioTag!, (value) {
    return _then(_self.copyWith(currentAudioTag: value));
  });
}
}

// dart format on
