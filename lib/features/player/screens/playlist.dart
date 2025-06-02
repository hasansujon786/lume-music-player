import 'package:flutter/material.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  static const routeName = '/playlist';
  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playlist')),
      body: const Center(child: Text('Hello World')),
    );
  }
}
