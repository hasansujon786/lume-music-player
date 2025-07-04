import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../../player/cubit/audio_player_cubit.dart';
import '../cubit/media_cubit.dart';
import '../cubit/songs_by_album_cubit.dart';
import '../widgets/album_list_item.dart';

class AlbumListPage extends StatefulWidget {
  const AlbumListPage({super.key});

  @override
  State<AlbumListPage> createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  @override
  void initState() {
    super.initState();
    context.read<MediaCubit>().loadAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SizedBox();
        }
        if (state.error != null) {
          return Text(state.error.toString());
        }

        return buildListView(state.albums);
      },
    );
  }

  Widget buildListView(List<AlbumModel> items) {
    if (items.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AlbumListItem(
          artworkId: item.id,
          title: item.album,
          subtitle: item.artist,
          // subtitle: 'Artist: ${item.artist}, Tracks: ${item.numOfSongs}',
          onTap: () async {
            context.read<SongsByAlbumCubit>().loadSongs(item.id);
            Navigator.of(context).pushNamed(
              Routes.songsByAlbum,
              arguments: SongsByAlbumScreenParams(albumName: item.album),
            );
          },
          onPlayTap: () {
            final setAudioFromFile = context.read<AudioPlayerCubit>().setAudioFromFile;
            final pushNamed = Navigator.of(context).pushNamed;

            context.read<SongsByAlbumCubit>().loadSongs(item.id).then((songs) {
              if (songs.isEmpty) return;
              if (!mounted) return;

              setAudioFromFile(songs, shouldPlay: true, index: 0);
              pushNamed(Routes.landing);
            });
          },
        );
      },
    );
  }
}
