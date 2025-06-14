export '../../features/browse/screens/browse_screen.dart';
export '../../features/browse/screens/songs_by_album_screen.dart';
export '../../features/browse/screens/songs_by_artist_screen.dart';
export '../../features/browse/screens/songs_by_genre_screen.dart';
export '../../features/home/screens/home_screen.dart';
export '../../features/player/screens/player_screen.dart';
export '../../features/player/screens/playlist.dart';
export '../../features/setting/screens/permissions.dart';

class Routes {
  // Global routes
  static const String landing = '/';

  static const String player = '/player';
  static const String playlist = '/playlist';

  static const String browse = '/browse';

  static const String permissions = '/permissions';

  // Page specific routes

  static const String songsByArtist = '/songsByArtist';
  static const String songsByAlbum = '/songsByAlbum';
  static const String songsByGenre = '/songsByGenre';
}
