import 'package:flutter/material.dart';

import '../../player/screens/player_screen.dart';
import '../../player/screens/songs_screen.dart';
import '../../setting/screens/permissions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  static const routeName = '/';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => Navigator.pushNamed(context, PlayerScreen.routeName),
              child: Text('Open Player'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, SongsScreen.routeName),
              child: Text('Songs'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, PermissionsScreen.routeName),
              child: Text('Permissions'),
            ),
          ],
        ),
      ),
    );
  }
}
