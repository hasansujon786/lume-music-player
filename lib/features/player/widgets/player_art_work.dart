import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusic/features/player/cubit/audio_player_cubit.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class PlayerArtWork extends StatefulWidget {
  const PlayerArtWork({super.key});

  @override
  State<PlayerArtWork> createState() => _PlayerArtWorkState();
}

class _PlayerArtWorkState extends State<PlayerArtWork> {
  int? artWorkId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioPlayerCubit, AudioPlayerState>(
      listenWhen: (prevState, state) => state.audio?.id != null && artWorkId != state.audio!.id,
      listener: (context, state) {
        setState(() => artWorkId = state.audio!.id);
      },
      child: Column(
        children: [
          SizedBox(height: 32),
          SizedBox(
            height: 320,
            width: 320,
            child: artWorkId == null
                ? buildEmptyArtwork()
                : QueryArtworkWidget(
                    nullArtworkWidget: buildEmptyArtwork(),
                    artworkClipBehavior: Clip.none,
                    id: artWorkId!,
                    type: ArtworkType.AUDIO,
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyArtwork() {
    return Icon(Icons.camera_alt_sharp);
  }
}
