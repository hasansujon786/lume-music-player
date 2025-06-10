import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../cubit/media_cubit.dart';
import '../cubit/songs_by_genre_cubit.dart';
import '../widgets/audio_list_item.dart';

class GenresListPage extends StatefulWidget {
  const GenresListPage({super.key});

  @override
  State<GenresListPage> createState() => _GenresListPageState();
}

class _GenresListPageState extends State<GenresListPage> {
  @override
  void initState() {
    super.initState();
    context.read<MediaCubit>().loadGenres();
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

        return buildListView(state.genres);
      },
    );
  }

  Widget buildListView(List<GenreModel> items) {
    if (items.isEmpty) return const Text('Nothing found!');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AudioListItem(
          artworkId: item.id,
          title: item.genre,
          subtitle: 'Tracks: ${item.numOfSongs}',
          onTap: () async {
            context.read<SongsByGenreCubit>().loadSongs(item.id);
            Navigator.of(context).pushNamed(
              Routes.songsByGenre,
              arguments: SongsByGenreScreenParams(genreName: item.genre),
            );
          },
        );
      },
    );
  }
}
