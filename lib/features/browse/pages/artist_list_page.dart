import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../cubit/songs_by_artist_cubit.dart';
import '../cubit/media_cubit.dart';
import '../widgets/audio_list_item.dart';

class ArtistListPage extends StatefulWidget {
  const ArtistListPage({super.key});

  @override
  State<ArtistListPage> createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
  @override
  void initState() {
    super.initState();
    print('xxxx initState artists_screen xxxxxxxxxxxxxxxxxxxxxxx');
    context.read<MediaCubit>().loadArtists();
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

        return buildListView(state.artists);
      },
    );
  }

  Widget buildListView(List<ArtistModel> items) {
    if (items.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AudioListItem(
          artworkId: item.id,
          title: item.artist,
          subtitle: 'Albums: ${item.numberOfAlbums}, Tracks: ${item.numberOfTracks}',
          onTap: () async {
            context.read<SongsByArtistCubit>().loadSongs(item.id);
            Navigator.of(context).pushNamed(
              Routes.songsByArtist,
              arguments: SongsByArtistScreenaParams(artistName: item.artist),
            );
          },
        );
      },
    );
  }
}
