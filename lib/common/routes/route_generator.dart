import 'package:flutter/material.dart';

import '../../features/browse/screens/artists_screen.dart';
import '../../features/browse/screens/songs_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/player/screens/player_screen.dart';
import '../../features/player/screens/playlist.dart';
import '../../features/setting/screens/permissions.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));

      case Routes.player:
        return MaterialPageRoute(builder: (context) => PlayerScreen());
      case Routes.playlist:
        return MaterialPageRoute(builder: (context) => Playlist());

      case Routes.browseArtists:
        return MaterialPageRoute(builder: (context) => ArtistsScreen());
      case Routes.browseSongs:
        return MaterialPageRoute(builder: (context) => SongsScreen());
      case Routes.permissions:
        return MaterialPageRoute(builder: (context) => PermissionsScreen());

      default:
        return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));
    }
  }
}
