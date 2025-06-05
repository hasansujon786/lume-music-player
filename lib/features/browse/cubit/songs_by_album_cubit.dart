import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_songs_by_type_cubit.dart';

part 'songs_by_album_cubit.freezed.dart';

class SongsByAlbumCubit extends BaseSongsBytypeCubit<SongsByAlbumState> {
  SongsByAlbumCubit(OnAudioQuery audioQuery) : super(audioQuery, const SongsByAlbumState.loading());

  @override
  AudiosFromType get queryType => AudiosFromType.ALBUM_ID;

  @override
  SongsByAlbumState buildLoadingState() => SongsByAlbumState.loading();

  @override
  SongsByAlbumState buildLoadedState(List<SongModel> songs) => SongsByAlbumState.loaded(songs);

  @override
  SongsByAlbumState buildErrorState(String message) => SongsByAlbumState.error(message);
}

@freezed
sealed class SongsByAlbumState with _$SongsByAlbumState {
  const SongsByAlbumState._(); // <== allows defining shared methods

  const factory SongsByAlbumState.loading() = AlbumLoading;
  const factory SongsByAlbumState.loaded(List<SongModel> songs) = AlbumLoaded;
  const factory SongsByAlbumState.error(String message) = AlbumError;

  bool get hasData => switch (this) {
    AlbumLoaded(:final songs) => songs.isNotEmpty,
    _ => false,
  };
}
