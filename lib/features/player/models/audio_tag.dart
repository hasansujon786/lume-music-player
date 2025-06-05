import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:on_audio_query_forked/on_audio_query.dart' show SongModel;

part 'audio_tag.freezed.dart';
part 'audio_tag.g.dart';

@freezed
abstract class AudioTag with _$AudioTag {
  const factory AudioTag({
    required int id,
    required String data,
    String? uri,
    required String displayName,
    required String displayNameWOExt,
    required int size,
    String? album,
    int? albumId,
    String? artist,
    int? artistId,
    String? genre,
    // int? genreId,
    int? bookmark,
    String? composer,
    int? dateAdded,
    int? dateModified,
    int? duration,
    required String title,
    int? track,
    required String fileExtension,
    required bool isAlarm,
    required bool isAudioBook,
    required bool isMusic,
    required bool isNotification,
    required bool isPodcast,
    required bool isRingtone,
  }) = _AudioTag;

  factory AudioTag.fromJson(Map<String, dynamic> json) => _$AudioTagFromJson(json);

  factory AudioTag.fromSongModel(SongModel song) {
    return AudioTag(
      id: song.id,
      data: song.data,
      uri: song.uri,
      displayName: song.displayName,
      displayNameWOExt: song.displayNameWOExt,
      size: song.size,
      album: song.album,
      albumId: song.albumId,
      artist: song.artist,
      artistId: song.artistId,
      genre: song.genre,
      // genreId: song.genreId,
      bookmark: song.bookmark,
      composer: song.composer,
      dateAdded: song.dateAdded,
      dateModified: song.dateModified,
      duration: song.duration,
      title: song.title,
      track: song.track,
      fileExtension: song.fileExtension,
      isAlarm: song.isAlarm ?? false,
      isAudioBook: song.isAudioBook ?? false,
      isMusic: song.isMusic ?? false,
      isNotification: song.isNotification ?? false,
      isPodcast: song.isPodcast ?? false,
      isRingtone: song.isRingtone ?? false,
    );
  }
}
