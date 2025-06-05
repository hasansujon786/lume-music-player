import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

abstract class BaseSongsBytypeCubit<T> extends Cubit<T> {
  final OnAudioQuery audioQuery;
  final Map<int, List<SongModel>> _cache = {};

  BaseSongsBytypeCubit(this.audioQuery, T initialState) : super(initialState);

  AudiosFromType get queryType;

  T buildLoadingState();
  T buildLoadedState(List<SongModel> songs);
  T buildErrorState(String message);

  Future<void> loadSongs(int id) async {
    emit(buildLoadingState());

    try {
      if (_cache.containsKey(id)) {
        emit(buildLoadedState(_cache[id]!));
        return;
      }

      final songs = await audioQuery.queryAudiosFrom(queryType, id);
      _cache[id] = songs;
      emit(buildLoadedState(songs));
    } catch (e) {
      emit(buildErrorState('Failed to load songs: $e'));
    }
  }
}
