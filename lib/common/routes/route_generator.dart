import 'package:flutter/material.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));

      case Routes.player:
        return MaterialPageRoute(builder: (context) => PlayerScreen());
      case Routes.playlist:
        return MaterialPageRoute(
          builder: (context) => Playlist(params: settings.arguments as PlaylistParams),
        );

      case Routes.browse:
        return MaterialPageRoute(builder: (context) => BrowseScreen(params: settings.arguments as BrowseScreenParams?));

      case Routes.songsByArtist:
        return MaterialPageRoute(
          builder: (context) =>
              SongsByArtistScreen(params: settings.arguments as SongsByArtistScreenaParams),
        );
      case Routes.songsByAlbum:
        return MaterialPageRoute(
          builder: (context) =>
              SongsByAlbumScreen(params: settings.arguments as SongsByAlbumScreenParams),
        );
      case Routes.songsByGenre:
        return MaterialPageRoute(
          builder: (context) =>
              SongsByGenreScreen(params: settings.arguments as SongsByGenreScreenParams),
        );

      case Routes.permissions:
        return MaterialPageRoute(builder: (context) => PermissionsScreen());
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));
    }
  }
}
