// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_by_artist_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SongsByArtistState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongsByArtistState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongsByArtistState()';
}


}

/// @nodoc
class $SongsByArtistStateCopyWith<$Res>  {
$SongsByArtistStateCopyWith(SongsByArtistState _, $Res Function(SongsByArtistState) __);
}


/// @nodoc


class ArtistLoading extends SongsByArtistState {
  const ArtistLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongsByArtistState.loading()';
}


}




/// @nodoc


class ArtistLoaded extends SongsByArtistState {
  const ArtistLoaded(final  List<SongModel> songs): _songs = songs,super._();
  

 final  List<SongModel> _songs;
 List<SongModel> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}


/// Create a copy of SongsByArtistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistLoadedCopyWith<ArtistLoaded> get copyWith => _$ArtistLoadedCopyWithImpl<ArtistLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistLoaded&&const DeepCollectionEquality().equals(other._songs, _songs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs));

@override
String toString() {
  return 'SongsByArtistState.loaded(songs: $songs)';
}


}

/// @nodoc
abstract mixin class $ArtistLoadedCopyWith<$Res> implements $SongsByArtistStateCopyWith<$Res> {
  factory $ArtistLoadedCopyWith(ArtistLoaded value, $Res Function(ArtistLoaded) _then) = _$ArtistLoadedCopyWithImpl;
@useResult
$Res call({
 List<SongModel> songs
});




}
/// @nodoc
class _$ArtistLoadedCopyWithImpl<$Res>
    implements $ArtistLoadedCopyWith<$Res> {
  _$ArtistLoadedCopyWithImpl(this._self, this._then);

  final ArtistLoaded _self;
  final $Res Function(ArtistLoaded) _then;

/// Create a copy of SongsByArtistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? songs = null,}) {
  return _then(ArtistLoaded(
null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,
  ));
}


}

/// @nodoc


class ArtistError extends SongsByArtistState {
  const ArtistError(this.message): super._();
  

 final  String message;

/// Create a copy of SongsByArtistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArtistErrorCopyWith<ArtistError> get copyWith => _$ArtistErrorCopyWithImpl<ArtistError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArtistError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SongsByArtistState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ArtistErrorCopyWith<$Res> implements $SongsByArtistStateCopyWith<$Res> {
  factory $ArtistErrorCopyWith(ArtistError value, $Res Function(ArtistError) _then) = _$ArtistErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ArtistErrorCopyWithImpl<$Res>
    implements $ArtistErrorCopyWith<$Res> {
  _$ArtistErrorCopyWithImpl(this._self, this._then);

  final ArtistError _self;
  final $Res Function(ArtistError) _then;

/// Create a copy of SongsByArtistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ArtistError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
