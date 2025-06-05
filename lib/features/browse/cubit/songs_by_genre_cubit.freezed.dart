// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'songs_by_genre_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SongsByGenreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SongsByGenreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongsByGenreState()';
}


}

/// @nodoc
class $SongsByGenreStateCopyWith<$Res>  {
$SongsByGenreStateCopyWith(SongsByGenreState _, $Res Function(SongsByGenreState) __);
}


/// @nodoc


class GenreLoading extends SongsByGenreState {
  const GenreLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SongsByGenreState.loading()';
}


}




/// @nodoc


class GenreLoaded extends SongsByGenreState {
  const GenreLoaded(final  List<SongModel> songs): _songs = songs,super._();
  

 final  List<SongModel> _songs;
 List<SongModel> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}


/// Create a copy of SongsByGenreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreLoadedCopyWith<GenreLoaded> get copyWith => _$GenreLoadedCopyWithImpl<GenreLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreLoaded&&const DeepCollectionEquality().equals(other._songs, _songs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs));

@override
String toString() {
  return 'SongsByGenreState.loaded(songs: $songs)';
}


}

/// @nodoc
abstract mixin class $GenreLoadedCopyWith<$Res> implements $SongsByGenreStateCopyWith<$Res> {
  factory $GenreLoadedCopyWith(GenreLoaded value, $Res Function(GenreLoaded) _then) = _$GenreLoadedCopyWithImpl;
@useResult
$Res call({
 List<SongModel> songs
});




}
/// @nodoc
class _$GenreLoadedCopyWithImpl<$Res>
    implements $GenreLoadedCopyWith<$Res> {
  _$GenreLoadedCopyWithImpl(this._self, this._then);

  final GenreLoaded _self;
  final $Res Function(GenreLoaded) _then;

/// Create a copy of SongsByGenreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? songs = null,}) {
  return _then(GenreLoaded(
null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,
  ));
}


}

/// @nodoc


class GenreError extends SongsByGenreState {
  const GenreError(this.message): super._();
  

 final  String message;

/// Create a copy of SongsByGenreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreErrorCopyWith<GenreError> get copyWith => _$GenreErrorCopyWithImpl<GenreError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenreError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SongsByGenreState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $GenreErrorCopyWith<$Res> implements $SongsByGenreStateCopyWith<$Res> {
  factory $GenreErrorCopyWith(GenreError value, $Res Function(GenreError) _then) = _$GenreErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GenreErrorCopyWithImpl<$Res>
    implements $GenreErrorCopyWith<$Res> {
  _$GenreErrorCopyWithImpl(this._self, this._then);

  final GenreError _self;
  final $Res Function(GenreError) _then;

/// Create a copy of SongsByGenreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GenreError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
