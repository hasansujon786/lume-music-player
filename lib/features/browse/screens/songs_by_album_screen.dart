import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/songs_by_album_cubit.dart';
import '../widgets/song_list_view.dart';

class SongsByAlbumScreenParams {
  final String albumName;
  const SongsByAlbumScreenParams({required this.albumName});
}

class SongsByAlbumScreen extends StatelessWidget {
  final SongsByAlbumScreenParams params;
  const SongsByAlbumScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(params.albumName),
      ),
      body: BlocBuilder<SongsByAlbumCubit, SongsByAlbumState>(
        builder: (context, state) {
          return switch (state) {
            AlbumLoading() => Center(child: Text('loading')),
            AlbumLoaded(:final songs) => SongListView(songs: songs),
            AlbumError(:final message) => Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}
