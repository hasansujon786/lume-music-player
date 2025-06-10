import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../browse/cubit/media_cubit.dart';
import '../widgets/song_list_view.dart';

class SongsListPage extends StatefulWidget {
  const SongsListPage({super.key});

  @override
  State<SongsListPage> createState() => _SongsListPageState();
}

class _SongsListPageState extends State<SongsListPage> {
  @override
  void initState() {
    super.initState();
    print('from init songs_screen');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      builder: (context, state) {
        if (state.isLoading) return const SizedBox();
        if (state.error != null) return Center(child: Text(state.error.toString()));
        return SongListView(songs: state.songs);
      },
    );
  }
}
