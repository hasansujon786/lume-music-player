import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/screens/home_screen.dart';
import 'features/player/cubit/audio_player_cubit.dart';
import 'features/player/screens/player_screen.dart';
import 'features/player/screens/playlist.dart';
import 'features/player/screens/songs_screen.dart';
import 'features/setting/screens/permissions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioPlayerCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: const HomeScreen(title: 'LumeMusicPlayer'),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case PlayerScreen.routeName:
              return MaterialPageRoute(builder: (context) => PlayerScreen());
            case Playlist.routeName:
              return MaterialPageRoute(builder: (context) => Playlist());
            case SongsScreen.routeName:
              return MaterialPageRoute(builder: (context) => SongsScreen());
            case PermissionsScreen.routeName:
              return MaterialPageRoute(builder: (context) => PermissionsScreen());
            case HomeScreen.routeName:
              return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));
            default:
              return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));
          }
        },
      ),
    );
  }
}
