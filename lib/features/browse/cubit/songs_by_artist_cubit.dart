import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_songs_by_type_cubit.dart';

part 'songs_by_artist_cubit.freezed.dart';

class SongsByArtistCubit extends BaseSongsBytypeCubit<SongsByArtistState> {
  SongsByArtistCubit(OnAudioQuery audioQuery)
    : super(audioQuery, const SongsByArtistState.loading());

  @override
  AudiosFromType get queryType => AudiosFromType.ARTIST_ID;

  @override
  SongsByArtistState buildLoadingState() => SongsByArtistState.loading();

  @override
  SongsByArtistState buildLoadedState(List<SongModel> songs) => SongsByArtistState.loaded(songs);

  @override
  SongsByArtistState buildErrorState(String message) => SongsByArtistState.error(message);
}

@freezed
sealed class SongsByArtistState with _$SongsByArtistState {
  const SongsByArtistState._(); // <== allows defining shared methods

  const factory SongsByArtistState.loading() = ArtistLoading;
  const factory SongsByArtistState.loaded(List<SongModel> songs) = ArtistLoaded;
  const factory SongsByArtistState.error(String message) = ArtistError;

  // Example: a shared getter
  bool get hasData => switch (this) {
    ArtistLoaded(:final songs) => songs.isNotEmpty,
    _ => false,
  };
}
