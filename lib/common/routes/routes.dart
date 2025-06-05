export '../../features/browse/screens/albums_screen.dart';
export '../../features/browse/screens/artists_screen.dart';
export '../../features/browse/screens/songs_by_artist_screen.dart';
export '../../features/browse/screens/songs_screen.dart';
export '../../features/home/screens/home_screen.dart';
export '../../features/player/screens/player_screen.dart';
export '../../features/player/screens/playlist.dart';
export '../../features/setting/screens/permissions.dart';
export '../../features/browse/screens/songs_by_album_screen.dart';

class Routes {
  // Global routes
  static const String landing = '/';

  static const String player = '/player';
  static const String playlist = '/playlist';

  static const String browseSongs = '/songs';
  static const String browseArtists = '/artists';
  static const String browseAlbums = '/albums';

  static const String permissions = '/permissions';

  // Page specific routes

  static const String songsByArtist = '/songsByArtist';
  static const String songsByAlbum = '/songsByAlbum';
}
