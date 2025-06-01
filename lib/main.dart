import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusic/features/setting/screens/permissions.dart';

import 'features/player/cubit/audio_player_cubit.dart';
import 'features/player/screens/player_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/player/screens/songs_screen.dart';

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
            case 'player':
              return MaterialPageRoute(builder: (context) => PlayerScreen());
            case 'songs':
              return MaterialPageRoute(builder: (context) => SongsScreen());
            case 'permissions':
              return MaterialPageRoute(builder: (context) => PermissionsScreen());
            default:
              return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));
          }
        },
      ),
    );
  }
}
