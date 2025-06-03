import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';

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
      body: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.playlist.length,
            itemBuilder: (context, index) {
              final item = state.playlist[index];
              return ListTile(
                leading: Icon(
                  state.currentIndex == index ? Icons.play_arrow_rounded : Icons.remove,
                ),
                title: Text(item.title),
                trailing: Icon(Icons.menu),
                onTap: () => context.read<AudioPlayerCubit>().playWithIndex(index),
              );
            },
          );
        },
      ),
    );
  }
}
