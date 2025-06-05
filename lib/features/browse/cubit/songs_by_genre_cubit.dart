import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base_songs_by_type_cubit.dart';

part 'songs_by_genre_cubit.freezed.dart';

class SongsByGenreCubit extends BaseSongsBytypeCubit<SongsByGenreState> {
  SongsByGenreCubit(OnAudioQuery audioQuery)
    : super(audioQuery, const SongsByGenreState.loading());

  @override
  AudiosFromType get queryType => AudiosFromType.GENRE_ID;

  @override
  SongsByGenreState buildLoadingState() => SongsByGenreState.loading();

  @override
  SongsByGenreState buildLoadedState(List<SongModel> songs) => SongsByGenreState.loaded(songs);

  @override
  SongsByGenreState buildErrorState(String message) => SongsByGenreState.error(message);
}

@freezed
sealed class SongsByGenreState with _$SongsByGenreState {
  const SongsByGenreState._(); // <== allows defining shared methods

  const factory SongsByGenreState.loading() = GenreLoading;
  const factory SongsByGenreState.loaded(List<SongModel> songs) = GenreLoaded;
  const factory SongsByGenreState.error(String message) = GenreError;

  // Example: a shared getter
  bool get hasData => switch (this) {
    GenreLoaded(:final songs) => songs.isNotEmpty,
    _ => false,
  };
}
