// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_by_album_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SongsByAlbumState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongsByAlbumState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongsByAlbumState()';
}


}

/// @nodoc
class $SongsByAlbumStateCopyWith<$Res>  {
$SongsByAlbumStateCopyWith(SongsByAlbumState _, $Res Function(SongsByAlbumState) __);
}


/// @nodoc


class AlbumLoading extends SongsByAlbumState {
  const AlbumLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongsByAlbumState.loading()';
}


}




/// @nodoc


class AlbumLoaded extends SongsByAlbumState {
  const AlbumLoaded(final  List<SongModel> songs): _songs = songs,super._();
  

 final  List<SongModel> _songs;
 List<SongModel> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}


/// Create a copy of SongsByAlbumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumLoadedCopyWith<AlbumLoaded> get copyWith => _$AlbumLoadedCopyWithImpl<AlbumLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumLoaded&&const DeepCollectionEquality().equals(other._songs, _songs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs));

@override
String toString() {
  return 'SongsByAlbumState.loaded(songs: $songs)';
}


}

/// @nodoc
abstract mixin class $AlbumLoadedCopyWith<$Res> implements $SongsByAlbumStateCopyWith<$Res> {
  factory $AlbumLoadedCopyWith(AlbumLoaded value, $Res Function(AlbumLoaded) _then) = _$AlbumLoadedCopyWithImpl;
@useResult
$Res call({
 List<SongModel> songs
});




}
/// @nodoc
class _$AlbumLoadedCopyWithImpl<$Res>
    implements $AlbumLoadedCopyWith<$Res> {
  _$AlbumLoadedCopyWithImpl(this._self, this._then);

  final AlbumLoaded _self;
  final $Res Function(AlbumLoaded) _then;

/// Create a copy of SongsByAlbumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? songs = null,}) {
  return _then(AlbumLoaded(
null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,
  ));
}


}

/// @nodoc


class AlbumError extends SongsByAlbumState {
  const AlbumError(this.message): super._();
  

 final  String message;

/// Create a copy of SongsByAlbumState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlbumErrorCopyWith<AlbumError> get copyWith => _$AlbumErrorCopyWithImpl<AlbumError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlbumError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SongsByAlbumState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AlbumErrorCopyWith<$Res> implements $SongsByAlbumStateCopyWith<$Res> {
  factory $AlbumErrorCopyWith(AlbumError value, $Res Function(AlbumError) _then) = _$AlbumErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AlbumErrorCopyWithImpl<$Res>
    implements $AlbumErrorCopyWith<$Res> {
  _$AlbumErrorCopyWithImpl(this._self, this._then);

  final AlbumError _self;
  final $Res Function(AlbumError) _then;

/// Create a copy of SongsByAlbumState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AlbumError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
