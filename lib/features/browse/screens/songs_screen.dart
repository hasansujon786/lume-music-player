import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../../browse/cubit/media_cubit.dart';
import '../../player/cubit/audio_player_cubit.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  final _audioQuery = AudioQueryManager().audioQuery;

  @override
  void initState() {
    super.initState();
  }

  checkAndRequestPermissions({bool retry = false}) async {
    context.read<MediaCubit>().checkAndRequestPermissions(retry: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Songs'),
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

          return buildListView(state.songs);
        },
      ),
    );
  }

  Widget buildListView(List<SongModel> songs) {
    if (songs.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () async {
            // TODO: restrict double tap
            final navigate = Navigator.of(context).pushNamed;
            await context.read<AudioPlayerCubit>().setAudioFromFile(
              songs,
              shouldPlay: true,
              index: index,
            );
            navigate(Routes.player);
          },
          title: Text(songs[index].title),
          subtitle: Text(songs[index].artist ?? 'No Artist'),
          leading: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
            child: QueryArtworkWidget(
              artworkClipBehavior: Clip.none,
              controller: _audioQuery,
              id: songs[index].id,
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
