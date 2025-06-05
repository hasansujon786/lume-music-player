import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../cubit/media_cubit.dart';
import '../cubit/songs_by_album_cubit.dart';
import '../widgets/audio_list_item.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({super.key});

  @override
  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MediaCubit>().loadAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: BlocBuilder<MediaCubit, MediaState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const SizedBox();
          }
          if (state.error != null) {
            return Text(state.error.toString());
          }

          return buildListView(state.albums);
        },
      ),
    );
  }

  Widget buildListView(List<AlbumModel> items) {
    if (items.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AudioListItem(
          artworkId: item.id,
          title: item.album,
          subtitle: 'Artist: ${item.artist}, Tracks: ${item.numOfSongs}',
          onTap: () async {
            context.read<SongsByAlbumCubit>().loadSongs(item.id);
            Navigator.of(context).pushNamed(
              Routes.songsByAlbum,
              arguments: SongsByAlbumScreenParams(albumName: item.album),
            );
          },
        );
      },
    );
  }
}
