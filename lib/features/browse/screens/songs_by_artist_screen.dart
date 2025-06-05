import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/songs_by_artist_cubit.dart';
import '../widgets/song_list_view.dart';

class SongsByArtistScreenaParams {
  final String artistName;
  const SongsByArtistScreenaParams({required this.artistName});
}

class SongsByArtistScreen extends StatefulWidget {
  final SongsByArtistScreenaParams params;
  const SongsByArtistScreen({super.key, required this.params});

  @override
  State<SongsByArtistScreen> createState() => _SongsByArtistScreenState();
}

class _SongsByArtistScreenState extends State<SongsByArtistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.params.artistName)),
      body: BlocBuilder<SongsByArtistCubit, SongsByArtistState>(
        builder: (context, state) {
          return switch (state) {
            ArtistLoading() => Center(child: Text('loading')),
            ArtistLoaded(:final songs) => SongListView(songs: songs),
            ArtistError(:final message) => Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}
