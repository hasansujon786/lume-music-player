import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/media_by_artist_cubit.dart';
import '../widgets/song_list_view.dart';

class SongsByArtistScreen extends StatefulWidget {
  const SongsByArtistScreen({super.key});

  @override
  State<SongsByArtistScreen> createState() => _SongsByArtistScreenState();
}

class _SongsByArtistScreenState extends State<SongsByArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Artist'),
      ),
      body: BlocBuilder<MediaByArtistCubit, MediaByArtistState>(
        builder: (context, state) {
          return switch (state) {
            Loading() => Center(child: Text('loading')),
            Loaded(:final songs) => SongListView(songs: songs),
            Error(:final message) => Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}
