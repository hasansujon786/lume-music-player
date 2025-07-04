import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/widgets.dart';
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
          return ArtWork(
            dimention: width,
            id: currentAudioTag?.id,
            iconSize: 90,
            centerIcon: true,
          );
        },
      ),
    );
  }
}
