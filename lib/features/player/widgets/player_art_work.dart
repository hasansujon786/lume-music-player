import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../cubit/audio_player_cubit.dart';
import '../models/audio_tag.dart';

class PlayerArtWork extends StatelessWidget {
  final double width;
  const PlayerArtWork({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: width,
      child: BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
        selector: (state) => state.currentAudioTag,
        builder: (context, currentAudioTag) {
          // return Container(color: Colors.red.shade300);
          return currentAudioTag == null
              ? buildEmptyArtwork()
              : QueryArtworkWidget(
                  artworkWidth: width,
                  artworkHeight: width,
                  size: width.toInt(),
                  artworkQuality: FilterQuality.high,
                  quality: 100,
                  nullArtworkWidget: buildEmptyArtwork(),
                  artworkClipBehavior: Clip.none,
                  id: currentAudioTag.id,
                  type: ArtworkType.AUDIO,
                );
        },
      ),
    );
  }

  Widget buildEmptyArtwork() {
    return Container(
      color: Colors.grey.shade300,
      child: Center(child: Icon(Icons.camera_alt_sharp)),
    );
  }
}
