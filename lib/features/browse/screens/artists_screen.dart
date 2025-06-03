import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../cubit/media_cubit.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  final _audioQuery = AudioQueryManager().audioQuery;

  @override
  void initState() {
    super.initState();
    context.read<MediaCubit>().loadArtists();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    context.read<MediaCubit>().checkAndRequestPermissions(retry: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Artists'),
      ),
      body: BlocBuilder<MediaCubit, MediaState>(
        builder: (context, state) {
          if (!state.hasPermission) {
            return noAccessToLibraryWidget();
          }
          if (state.isLoading) {
            return const SizedBox();
          }
          if (state.error != null) {
            return Text(state.error.toString());
          }

          return buildListView(state.artists);
        },
      ),
    );
  }

  Widget buildListView(List<ArtistModel> items) {
    if (items.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          onTap: () async {
            // final navigate = Navigator.of(context).pushNamed;
            // await context.read<AudioPlayerCubit>().setAudioFromFile(
            //   items,
            //   shouldPlay: true,
            //   index: index,
            // );
            // navigate(PlayerScreen.routeName);
          },
          title: Text(item.artist),
          subtitle: Text('Albums: ${item.numberOfAlbums}, Tracks: ${item.numberOfTracks}'),
          leading: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
            child: QueryArtworkWidget(
              artworkClipBehavior: Clip.none,
              controller: _audioQuery,
              id: items[index].id,
              type: ArtworkType.AUDIO,
            ),
          ),
        );
      },
    );
  }

  Widget noAccessToLibraryWidget() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          border: BoxBorder.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 6),
            const Text(
              "Application doesn't have access to the library",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            FilledButton.tonal(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.greenAccent.shade200),
              ),
              onPressed: () => checkAndRequestPermissions(retry: true),
              child: const Text('Allow'),
            ),
          ],
        ),
      ),
    );
  }
}
