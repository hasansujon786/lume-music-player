import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../../player/cubit/audio_player_cubit.dart';
import 'audio_list_item.dart';

class SongListView extends StatelessWidget {
  final List<SongModel> songs;
  const SongListView({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    if (songs.isEmpty) return Center(child: const Text('Nothing found!'));

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final item = songs[index];
        return AudioListItem(
          artworkId: item.id,
          title: item.title,
          subtitle: item.artist ?? 'No Artist',
          onTap: () {
            // TODO: restrict double tap
            context.read<AudioPlayerCubit>().setAudioFromFile(
              songs,
              shouldPlay: true,
              index: index,
            );
            // Navigator.of(context).pop();
            Navigator.of(context).pushNamed(Routes.landing);
          },
        );
      },
    );
  }
}
