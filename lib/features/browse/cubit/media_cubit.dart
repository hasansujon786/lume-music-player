import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

part 'media_cubit.freezed.dart';

class MediaCubit extends Cubit<MediaState> {
  final OnAudioQuery _audioQuery;

  MediaCubit(this._audioQuery) : super(const MediaState()) {
    // LogConfig logConfig = LogConfig(logType: LogType.DEBUG);
    // _audioQuery.setLogConfig(logConfig);
    _init();
  }

  Future<void> _init() async {
    final hasPermission = await checkAndRequestPermissions();
    if (hasPermission) {
      loadSongs(retry: true);
    }
  }

  Future<bool> checkAndRequestPermissions({bool retry = false}) async {
    final permission = await _audioQuery.checkAndRequest(retryRequest: retry);
    emit(state.copyWith(hasPermission: permission));
    return permission;
  }

  Future<void> loadSongs({bool retry = false}) async {
    if (!retry && state.songs.isNotEmpty) return;

    emit(state.copyWith(isLoading: true));
    try {
      final songs = await _audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      emit(state.copyWith(isLoading: false, songs: songs));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadArtists({bool retry = false}) async {
    if (!retry && state.artists.isNotEmpty) return;

    emit(state.copyWith(isLoading: true));
    try {
      final artists = await _audioQuery.queryArtists();
      emit(state.copyWith(isLoading: false, artists: artists));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> loadAlbums({bool retry = false}) async {
    if (!retry && state.albums.isNotEmpty) return;

    emit(state.copyWith(isLoading: true));
    try {
      final albums = await _audioQuery.queryAlbums();
      emit(state.copyWith(isLoading: false, albums: albums));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}

@freezed
abstract class MediaState with _$MediaState {
  const factory MediaState({
    @Default([]) List<SongModel> songs,
    @Default([]) List<ArtistModel> artists,
    @Default([]) List<AlbumModel> albums,
    @Default(false) bool isLoading,
    @Default(false) bool hasPermission,
    String? error,
  }) = _MediaState;
}

class AudioQueryManager {
  static final AudioQueryManager _instance = AudioQueryManager._internal();
  factory AudioQueryManager() => _instance;
  AudioQueryManager._internal();

  // Public fields
  final OnAudioQuery audioQuery = OnAudioQuery();
}
