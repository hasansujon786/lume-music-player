import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../../../common/theme/styles.dart';
import '../../player/cubit/audio_player_cubit.dart';
import '../cubit/media_cubit.dart';
import '../cubit/songs_by_artist_cubit.dart';

class ArtistListPage extends StatefulWidget {
  const ArtistListPage({super.key});

  @override
  State<ArtistListPage> createState() => _ArtistListPageState();
}

class _ArtistListPageState extends State<ArtistListPage> {
  @override
  void initState() {
    super.initState();
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

        return _buildListView(state.artists);
      },
    );
  }

  _playArtistSongs(BuildContext context, int id) async {
    final setAudioFromFile = context.read<AudioPlayerCubit>().setAudioFromFile;
    final pushNamed = Navigator.of(context).pushNamed;
    final songs = await context.read<SongsByArtistCubit>().loadSongs(id);
    if (songs.isEmpty) {
      return;
    }
    setAudioFromFile(songs, shouldPlay: true, index: 0);
    pushNamed(Routes.landing);
  }

  Widget _buildListView(List<ArtistModel> items) {
    if (items.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: IconButton.outlined(
            icon: Icon(FluentIcons.play_20_filled),
            onPressed: () => _playArtistSongs(context, item.id),
            style: IconButton.styleFrom(side: const BorderSide(width: Styles.iconBorderSize)),
          ),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          title: Text(item.artist, style: Theme.of(context).textTheme.headlineSmall),
          // subtitle: Text('Albums: ${item.numberOfAlbums}, Tracks: ${item.numberOfTracks}'),
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
