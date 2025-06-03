// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioTag _$AudioTagFromJson(Map<String, dynamic> json) => _AudioTag(
  id: (json['id'] as num).toInt(),
  data: json['data'] as String,
  uri: json['uri'] as String?,
  displayName: json['displayName'] as String,
  displayNameWOExt: json['displayNameWOExt'] as String,
  size: (json['size'] as num).toInt(),
  album: json['album'] as String?,
  albumId: (json['albumId'] as num?)?.toInt(),
  artist: json['artist'] as String?,
  artistId: (json['artistId'] as num?)?.toInt(),
  genre: json['genre'] as String?,
  genreId: (json['genreId'] as num?)?.toInt(),
  bookmark: (json['bookmark'] as num?)?.toInt(),
  composer: json['composer'] as String?,
  dateAdded: (json['dateAdded'] as num?)?.toInt(),
  dateModified: (json['dateModified'] as num?)?.toInt(),
  duration: (json['duration'] as num?)?.toInt(),
  title: json['title'] as String,
  track: (json['track'] as num?)?.toInt(),
  fileExtension: json['fileExtension'] as String,
  isAlarm: json['isAlarm'] as bool,
  isAudioBook: json['isAudioBook'] as bool,
  isMusic: json['isMusic'] as bool,
  isNotification: json['isNotification'] as bool,
  isPodcast: json['isPodcast'] as bool,
  isRingtone: json['isRingtone'] as bool,
);

Map<String, dynamic> _$AudioTagToJson(_AudioTag instance) => <String, dynamic>{
  'id': instance.id,
  'data': instance.data,
  'uri': instance.uri,
  'displayName': instance.displayName,
  'displayNameWOExt': instance.displayNameWOExt,
  'size': instance.size,
  'album': instance.album,
  'albumId': instance.albumId,
  'artist': instance.artist,
  'artistId': instance.artistId,
  'genre': instance.genre,
  'genreId': instance.genreId,
  'bookmark': instance.bookmark,
  'composer': instance.composer,
  'dateAdded': instance.dateAdded,
  'dateModified': instance.dateModified,
  'duration': instance.duration,
  'title': instance.title,
  'track': instance.track,
  'fileExtension': instance.fileExtension,
  'isAlarm': instance.isAlarm,
  'isAudioBook': instance.isAudioBook,
  'isMusic': instance.isMusic,
  'isNotification': instance.isNotification,
  'isPodcast': instance.isPodcast,
  'isRingtone': instance.isRingtone,
};
