import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../browse/cubit/media_cubit.dart';
import '../widgets/song_list_view.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Songs'),
      ),
      body: BlocBuilder<MediaCubit, MediaState>(
        builder: (context, state) {
          if (state.isLoading) return const SizedBox();
          if (state.error != null) return Center(child: Text(state.error.toString()));
          return SongListView(songs: state.songs);
        },
      ),
    );
  }
}
