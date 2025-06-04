import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_by_artist_cubit.freezed.dart';

class MediaByArtistCubit extends Cubit<MediaByArtistState> {
  final OnAudioQuery _audioQuery;
  final Map<int, List<SongModel>> _cache = {};

  MediaByArtistCubit(this._audioQuery) : super(const MediaByArtistState.loading());

  Future<void> loadSongsForArtist(int artistId) async {
    emit(const MediaByArtistState.loading());

    try {
      if (_cache.containsKey(artistId)) {
        emit(MediaByArtistState.loaded(_cache[artistId]!));
        return;
      }

      final songs = await _audioQuery.queryAudiosFrom(AudiosFromType.ARTIST_ID, artistId);

      _cache[artistId] = songs;
      emit(MediaByArtistState.loaded(songs));
    } catch (e) {
      emit(MediaByArtistState.error('Failed to load songs: $e'));
    }
  }
}

@freezed
sealed class MediaByArtistState with _$MediaByArtistState {
  const MediaByArtistState._(); // <== allows defining shared methods

  const factory MediaByArtistState.loading() = Loading;
  const factory MediaByArtistState.loaded(List<SongModel> songs) = Loaded;
  const factory MediaByArtistState.error(String message) = Error;

  // Example: a shared getter
  bool get hasData => switch (this) {
    Loaded(:final songs) => songs.isNotEmpty,
    _ => false,
  };
}
