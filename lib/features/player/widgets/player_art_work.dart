import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../cubit/audio_player_cubit.dart';

class PlayerArtWork extends StatefulWidget {
  const PlayerArtWork({super.key});

  @override
  State<PlayerArtWork> createState() => _PlayerArtWorkState();
}

class _PlayerArtWorkState extends State<PlayerArtWork> {
  double size = 320;
  int? artWorkId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioPlayerCubit, AudioPlayerState>(
      listenWhen: (prevState, state) =>
          state.currentAudioTag?.id != null && artWorkId != state.currentAudioTag?.id,
      listener: (context, state) {
        setState(() => artWorkId = state.currentAudioTag?.id);
      },
      child: Column(
        children: [
          SizedBox(height: 32),
          artWorkId == null
              ? buildEmptyArtwork()
              : QueryArtworkWidget(
                  artworkWidth: size,
                  artworkHeight: size,
                  size: size.toInt(),
                  artworkQuality: FilterQuality.high,
                  quality: 100,
                  nullArtworkWidget: buildEmptyArtwork(),
                  artworkClipBehavior: Clip.none,
                  id: artWorkId!,
                  type: ArtworkType.AUDIO,
                ),
        ],
      ),
    );
  }

  Widget buildEmptyArtwork() {
    return SizedBox(height: size, width: size, child: Icon(Icons.camera_alt_sharp));
  }
}
