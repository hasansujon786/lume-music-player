// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MediaState {

 List<SongModel> get songs; List<ArtistModel> get artists; List<AlbumModel> get albums; List<GenreModel> get genres; bool get isLoading; bool get hasPermission; String? get error;
/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStateCopyWith<MediaState> get copyWith => _$MediaStateCopyWithImpl<MediaState>(this as MediaState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaState&&const DeepCollectionEquality().equals(other.songs, songs)&&const DeepCollectionEquality().equals(other.artists, artists)&&const DeepCollectionEquality().equals(other.albums, albums)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasPermission, hasPermission) || other.hasPermission == hasPermission)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(songs),const DeepCollectionEquality().hash(artists),const DeepCollectionEquality().hash(albums),const DeepCollectionEquality().hash(genres),isLoading,hasPermission,error);

@override
String toString() {
  return 'MediaState(songs: $songs, artists: $artists, albums: $albums, genres: $genres, isLoading: $isLoading, hasPermission: $hasPermission, error: $error)';
}


}

/// @nodoc
abstract mixin class $MediaStateCopyWith<$Res>  {
  factory $MediaStateCopyWith(MediaState value, $Res Function(MediaState) _then) = _$MediaStateCopyWithImpl;
@useResult
$Res call({
 List<SongModel> songs, List<ArtistModel> artists, List<AlbumModel> albums, List<GenreModel> genres, bool isLoading, bool hasPermission, String? error
});




}
/// @nodoc
class _$MediaStateCopyWithImpl<$Res>
    implements $MediaStateCopyWith<$Res> {
  _$MediaStateCopyWithImpl(this._self, this._then);

  final MediaState _self;
  final $Res Function(MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? songs = null,Object? artists = null,Object? albums = null,Object? genres = null,Object? isLoading = null,Object? hasPermission = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,artists: null == artists ? _self.artists : artists // ignore: cast_nullable_to_non_nullable
as List<ArtistModel>,albums: null == albums ? _self.albums : albums // ignore: cast_nullable_to_non_nullable
as List<AlbumModel>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasPermission: null == hasPermission ? _self.hasPermission : hasPermission // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _MediaState implements MediaState {
  const _MediaState({final  List<SongModel> songs = const [], final  List<ArtistModel> artists = const [], final  List<AlbumModel> albums = const [], final  List<GenreModel> genres = const [], this.isLoading = false, this.hasPermission = false, this.error}): _songs = songs,_artists = artists,_albums = albums,_genres = genres;
  

 final  List<SongModel> _songs;
@override@JsonKey() List<SongModel> get songs {
  if (_songs is EqualUnmodifiableListView) return _songs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_songs);
}

 final  List<ArtistModel> _artists;
@override@JsonKey() List<ArtistModel> get artists {
  if (_artists is EqualUnmodifiableListView) return _artists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_artists);
}

 final  List<AlbumModel> _albums;
@override@JsonKey() List<AlbumModel> get albums {
  if (_albums is EqualUnmodifiableListView) return _albums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_albums);
}

 final  List<GenreModel> _genres;
@override@JsonKey() List<GenreModel> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasPermission;
@override final  String? error;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaStateCopyWith<_MediaState> get copyWith => __$MediaStateCopyWithImpl<_MediaState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaState&&const DeepCollectionEquality().equals(other._songs, _songs)&&const DeepCollectionEquality().equals(other._artists, _artists)&&const DeepCollectionEquality().equals(other._albums, _albums)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasPermission, hasPermission) || other.hasPermission == hasPermission)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_songs),const DeepCollectionEquality().hash(_artists),const DeepCollectionEquality().hash(_albums),const DeepCollectionEquality().hash(_genres),isLoading,hasPermission,error);

@override
String toString() {
  return 'MediaState(songs: $songs, artists: $artists, albums: $albums, genres: $genres, isLoading: $isLoading, hasPermission: $hasPermission, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MediaStateCopyWith<$Res> implements $MediaStateCopyWith<$Res> {
  factory _$MediaStateCopyWith(_MediaState value, $Res Function(_MediaState) _then) = __$MediaStateCopyWithImpl;
@override @useResult
$Res call({
 List<SongModel> songs, List<ArtistModel> artists, List<AlbumModel> albums, List<GenreModel> genres, bool isLoading, bool hasPermission, String? error
});




}
/// @nodoc
class __$MediaStateCopyWithImpl<$Res>
    implements _$MediaStateCopyWith<$Res> {
  __$MediaStateCopyWithImpl(this._self, this._then);

  final _MediaState _self;
  final $Res Function(_MediaState) _then;

/// Create a copy of MediaState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? songs = null,Object? artists = null,Object? albums = null,Object? genres = null,Object? isLoading = null,Object? hasPermission = null,Object? error = freezed,}) {
  return _then(_MediaState(
songs: null == songs ? _self._songs : songs // ignore: cast_nullable_to_non_nullable
as List<SongModel>,artists: null == artists ? _self._artists : artists // ignore: cast_nullable_to_non_nullable
as List<ArtistModel>,albums: null == albums ? _self._albums : albums // ignore: cast_nullable_to_non_nullable
as List<AlbumModel>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasPermission: null == hasPermission ? _self.hasPermission : hasPermission // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
