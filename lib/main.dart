import 'package:flutter/material.dart';

import 'features/player/screens/player_screen.dart';
import 'features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomeScreen(title: 'LumeMusicPlayer'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case 'player':
            return MaterialPageRoute(builder: (context) => PlayerScreen(title: 'LumeMusicPlayer'));
          default:
            return MaterialPageRoute(builder: (context) => HomeScreen(title: 'LumeMusicPlayer'));
        }
      },
    );
  }
}
