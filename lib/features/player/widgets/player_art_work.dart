import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../cubit/audio_player_cubit.dart';
import '../models/audio_tag.dart';

double _playerArtworkSize = 320;

class PlayerArtWork extends StatelessWidget {
  const PlayerArtWork({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
      selector: (state) => state.currentAudioTag,
      builder: (context, currentAudioTag) {
        return currentAudioTag == null
            ? buildEmptyArtwork()
            : QueryArtworkWidget(
                artworkWidth: _playerArtworkSize,
                artworkHeight: _playerArtworkSize,
                size: _playerArtworkSize.toInt(),
                artworkQuality: FilterQuality.high,
                quality: 100,
                nullArtworkWidget: buildEmptyArtwork(),
                artworkClipBehavior: Clip.none,
                id: currentAudioTag.id,
                type: ArtworkType.AUDIO,
              );
      },
    );
  }

  Widget buildEmptyArtwork() {
    return SizedBox(
      height: _playerArtworkSize,
      width: _playerArtworkSize,
      child: Icon(Icons.camera_alt_sharp),
    );
  }
}
