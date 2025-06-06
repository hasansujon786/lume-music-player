import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/songs_by_genre_cubit.dart';
import '../widgets/song_list_view.dart';

class SongsByGenreScreenParams {
  final String genreName;
  const SongsByGenreScreenParams({required this.genreName});
}

class SongsByGenreScreen extends StatelessWidget {
  final SongsByGenreScreenParams params;
  const SongsByGenreScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(params.genreName)),
      body: BlocBuilder<SongsByGenreCubit, SongsByGenreState>(
        builder: (context, state) {
          return switch (state) {
            GenreLoading() => Center(child: Text('loading')),
            GenreLoaded(:final songs) => SongListView(songs: songs),
            GenreError(:final message) => Center(child: Text('Error: $message')),
          };
        },
      ),
    );
  }
}
