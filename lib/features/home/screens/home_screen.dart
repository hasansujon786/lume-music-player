import 'package:flutter/material.dart';

import '../../../common/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

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
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.permissions),
            icon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.player),
              child: Text('Open Player'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.browseSongs),
              child: Text('Songs'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Routes.browseArtists),
              child: Text('Artists'),
            ),
          ],
        ),
      ),
    );
  }
}
