// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioTag {

 int get id; String get data; String? get uri; String get displayName; String get displayNameWOExt; int get size; String? get album; int? get albumId; String? get artist; int? get artistId; String? get genre; int? get genreId; int? get bookmark; String? get composer; int? get dateAdded; int? get dateModified; int? get duration; String get title; int? get track; String get fileExtension; bool get isAlarm; bool get isAudioBook; bool get isMusic; bool get isNotification; bool get isPodcast; bool get isRingtone;
/// Create a copy of AudioTag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioTagCopyWith<AudioTag> get copyWith => _$AudioTagCopyWithImpl<AudioTag>(this as AudioTag, _$identity);

  /// Serializes this AudioTag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioTag&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.displayNameWOExt, displayNameWOExt) || other.displayNameWOExt == displayNameWOExt)&&(identical(other.size, size) || other.size == size)&&(identical(other.album, album) || other.album == album)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.genreId, genreId) || other.genreId == genreId)&&(identical(other.bookmark, bookmark) || other.bookmark == bookmark)&&(identical(other.composer, composer) || other.composer == composer)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.track, track) || other.track == track)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.isAlarm, isAlarm) || other.isAlarm == isAlarm)&&(identical(other.isAudioBook, isAudioBook) || other.isAudioBook == isAudioBook)&&(identical(other.isMusic, isMusic) || other.isMusic == isMusic)&&(identical(other.isNotification, isNotification) || other.isNotification == isNotification)&&(identical(other.isPodcast, isPodcast) || other.isPodcast == isPodcast)&&(identical(other.isRingtone, isRingtone) || other.isRingtone == isRingtone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,data,uri,displayName,displayNameWOExt,size,album,albumId,artist,artistId,genre,genreId,bookmark,composer,dateAdded,dateModified,duration,title,track,fileExtension,isAlarm,isAudioBook,isMusic,isNotification,isPodcast,isRingtone]);

@override
String toString() {
  return 'AudioTag(id: $id, data: $data, uri: $uri, displayName: $displayName, displayNameWOExt: $displayNameWOExt, size: $size, album: $album, albumId: $albumId, artist: $artist, artistId: $artistId, genre: $genre, genreId: $genreId, bookmark: $bookmark, composer: $composer, dateAdded: $dateAdded, dateModified: $dateModified, duration: $duration, title: $title, track: $track, fileExtension: $fileExtension, isAlarm: $isAlarm, isAudioBook: $isAudioBook, isMusic: $isMusic, isNotification: $isNotification, isPodcast: $isPodcast, isRingtone: $isRingtone)';
}


}

/// @nodoc
abstract mixin class $AudioTagCopyWith<$Res>  {
  factory $AudioTagCopyWith(AudioTag value, $Res Function(AudioTag) _then) = _$AudioTagCopyWithImpl;
@useResult
$Res call({
 int id, String data, String? uri, String displayName, String displayNameWOExt, int size, String? album, int? albumId, String? artist, int? artistId, String? genre, int? genreId, int? bookmark, String? composer, int? dateAdded, int? dateModified, int? duration, String title, int? track, String fileExtension, bool isAlarm, bool isAudioBook, bool isMusic, bool isNotification, bool isPodcast, bool isRingtone
});




}
/// @nodoc
class _$AudioTagCopyWithImpl<$Res>
    implements $AudioTagCopyWith<$Res> {
  _$AudioTagCopyWithImpl(this._self, this._then);

  final AudioTag _self;
  final $Res Function(AudioTag) _then;

/// Create a copy of AudioTag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? data = null,Object? uri = freezed,Object? displayName = null,Object? displayNameWOExt = null,Object? size = null,Object? album = freezed,Object? albumId = freezed,Object? artist = freezed,Object? artistId = freezed,Object? genre = freezed,Object? genreId = freezed,Object? bookmark = freezed,Object? composer = freezed,Object? dateAdded = freezed,Object? dateModified = freezed,Object? duration = freezed,Object? title = null,Object? track = freezed,Object? fileExtension = null,Object? isAlarm = null,Object? isAudioBook = null,Object? isMusic = null,Object? isNotification = null,Object? isPodcast = null,Object? isRingtone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,displayNameWOExt: null == displayNameWOExt ? _self.displayNameWOExt : displayNameWOExt // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,albumId: freezed == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,artistId: freezed == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as int?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,genreId: freezed == genreId ? _self.genreId : genreId // ignore: cast_nullable_to_non_nullable
as int?,bookmark: freezed == bookmark ? _self.bookmark : bookmark // ignore: cast_nullable_to_non_nullable
as int?,composer: freezed == composer ? _self.composer : composer // ignore: cast_nullable_to_non_nullable
as String?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int?,dateModified: freezed == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,track: freezed == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: null == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String,isAlarm: null == isAlarm ? _self.isAlarm : isAlarm // ignore: cast_nullable_to_non_nullable
as bool,isAudioBook: null == isAudioBook ? _self.isAudioBook : isAudioBook // ignore: cast_nullable_to_non_nullable
as bool,isMusic: null == isMusic ? _self.isMusic : isMusic // ignore: cast_nullable_to_non_nullable
as bool,isNotification: null == isNotification ? _self.isNotification : isNotification // ignore: cast_nullable_to_non_nullable
as bool,isPodcast: null == isPodcast ? _self.isPodcast : isPodcast // ignore: cast_nullable_to_non_nullable
as bool,isRingtone: null == isRingtone ? _self.isRingtone : isRingtone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AudioTag implements AudioTag {
  const _AudioTag({required this.id, required this.data, this.uri, required this.displayName, required this.displayNameWOExt, required this.size, this.album, this.albumId, this.artist, this.artistId, this.genre, this.genreId, this.bookmark, this.composer, this.dateAdded, this.dateModified, this.duration, required this.title, this.track, required this.fileExtension, required this.isAlarm, required this.isAudioBook, required this.isMusic, required this.isNotification, required this.isPodcast, required this.isRingtone});
  factory _AudioTag.fromJson(Map<String, dynamic> json) => _$AudioTagFromJson(json);

@override final  int id;
@override final  String data;
@override final  String? uri;
@override final  String displayName;
@override final  String displayNameWOExt;
@override final  int size;
@override final  String? album;
@override final  int? albumId;
@override final  String? artist;
@override final  int? artistId;
@override final  String? genre;
@override final  int? genreId;
@override final  int? bookmark;
@override final  String? composer;
@override final  int? dateAdded;
@override final  int? dateModified;
@override final  int? duration;
@override final  String title;
@override final  int? track;
@override final  String fileExtension;
@override final  bool isAlarm;
@override final  bool isAudioBook;
@override final  bool isMusic;
@override final  bool isNotification;
@override final  bool isPodcast;
@override final  bool isRingtone;

/// Create a copy of AudioTag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioTagCopyWith<_AudioTag> get copyWith => __$AudioTagCopyWithImpl<_AudioTag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioTagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioTag&&(identical(other.id, id) || other.id == id)&&(identical(other.data, data) || other.data == data)&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.displayNameWOExt, displayNameWOExt) || other.displayNameWOExt == displayNameWOExt)&&(identical(other.size, size) || other.size == size)&&(identical(other.album, album) || other.album == album)&&(identical(other.albumId, albumId) || other.albumId == albumId)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.artistId, artistId) || other.artistId == artistId)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.genreId, genreId) || other.genreId == genreId)&&(identical(other.bookmark, bookmark) || other.bookmark == bookmark)&&(identical(other.composer, composer) || other.composer == composer)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded)&&(identical(other.dateModified, dateModified) || other.dateModified == dateModified)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.title, title) || other.title == title)&&(identical(other.track, track) || other.track == track)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.isAlarm, isAlarm) || other.isAlarm == isAlarm)&&(identical(other.isAudioBook, isAudioBook) || other.isAudioBook == isAudioBook)&&(identical(other.isMusic, isMusic) || other.isMusic == isMusic)&&(identical(other.isNotification, isNotification) || other.isNotification == isNotification)&&(identical(other.isPodcast, isPodcast) || other.isPodcast == isPodcast)&&(identical(other.isRingtone, isRingtone) || other.isRingtone == isRingtone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,data,uri,displayName,displayNameWOExt,size,album,albumId,artist,artistId,genre,genreId,bookmark,composer,dateAdded,dateModified,duration,title,track,fileExtension,isAlarm,isAudioBook,isMusic,isNotification,isPodcast,isRingtone]);

@override
String toString() {
  return 'AudioTag(id: $id, data: $data, uri: $uri, displayName: $displayName, displayNameWOExt: $displayNameWOExt, size: $size, album: $album, albumId: $albumId, artist: $artist, artistId: $artistId, genre: $genre, genreId: $genreId, bookmark: $bookmark, composer: $composer, dateAdded: $dateAdded, dateModified: $dateModified, duration: $duration, title: $title, track: $track, fileExtension: $fileExtension, isAlarm: $isAlarm, isAudioBook: $isAudioBook, isMusic: $isMusic, isNotification: $isNotification, isPodcast: $isPodcast, isRingtone: $isRingtone)';
}


}

/// @nodoc
abstract mixin class _$AudioTagCopyWith<$Res> implements $AudioTagCopyWith<$Res> {
  factory _$AudioTagCopyWith(_AudioTag value, $Res Function(_AudioTag) _then) = __$AudioTagCopyWithImpl;
@override @useResult
$Res call({
 int id, String data, String? uri, String displayName, String displayNameWOExt, int size, String? album, int? albumId, String? artist, int? artistId, String? genre, int? genreId, int? bookmark, String? composer, int? dateAdded, int? dateModified, int? duration, String title, int? track, String fileExtension, bool isAlarm, bool isAudioBook, bool isMusic, bool isNotification, bool isPodcast, bool isRingtone
});




}
/// @nodoc
class __$AudioTagCopyWithImpl<$Res>
    implements _$AudioTagCopyWith<$Res> {
  __$AudioTagCopyWithImpl(this._self, this._then);

  final _AudioTag _self;
  final $Res Function(_AudioTag) _then;

/// Create a copy of AudioTag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? data = null,Object? uri = freezed,Object? displayName = null,Object? displayNameWOExt = null,Object? size = null,Object? album = freezed,Object? albumId = freezed,Object? artist = freezed,Object? artistId = freezed,Object? genre = freezed,Object? genreId = freezed,Object? bookmark = freezed,Object? composer = freezed,Object? dateAdded = freezed,Object? dateModified = freezed,Object? duration = freezed,Object? title = null,Object? track = freezed,Object? fileExtension = null,Object? isAlarm = null,Object? isAudioBook = null,Object? isMusic = null,Object? isNotification = null,Object? isPodcast = null,Object? isRingtone = null,}) {
  return _then(_AudioTag(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,uri: freezed == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,displayNameWOExt: null == displayNameWOExt ? _self.displayNameWOExt : displayNameWOExt // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,album: freezed == album ? _self.album : album // ignore: cast_nullable_to_non_nullable
as String?,albumId: freezed == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as int?,artist: freezed == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String?,artistId: freezed == artistId ? _self.artistId : artistId // ignore: cast_nullable_to_non_nullable
as int?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,genreId: freezed == genreId ? _self.genreId : genreId // ignore: cast_nullable_to_non_nullable
as int?,bookmark: freezed == bookmark ? _self.bookmark : bookmark // ignore: cast_nullable_to_non_nullable
as int?,composer: freezed == composer ? _self.composer : composer // ignore: cast_nullable_to_non_nullable
as String?,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as int?,dateModified: freezed == dateModified ? _self.dateModified : dateModified // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,track: freezed == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: null == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String,isAlarm: null == isAlarm ? _self.isAlarm : isAlarm // ignore: cast_nullable_to_non_nullable
as bool,isAudioBook: null == isAudioBook ? _self.isAudioBook : isAudioBook // ignore: cast_nullable_to_non_nullable
as bool,isMusic: null == isMusic ? _self.isMusic : isMusic // ignore: cast_nullable_to_non_nullable
as bool,isNotification: null == isNotification ? _self.isNotification : isNotification // ignore: cast_nullable_to_non_nullable
as bool,isPodcast: null == isPodcast ? _self.isPodcast : isPodcast // ignore: cast_nullable_to_non_nullable
as bool,isRingtone: null == isRingtone ? _self.isRingtone : isRingtone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
