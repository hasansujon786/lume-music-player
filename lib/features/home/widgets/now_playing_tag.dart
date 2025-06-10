import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/routes/routes.dart';
import '../../../common/utils/utils.dart';
import '../../player/cubit/audio_player_cubit.dart';
import '../../player/models/audio_tag.dart';

double _playerArtworkSize = 120;

class NowPlayingTag extends StatelessWidget {
  const NowPlayingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
      selector: (state) => state.currentAudioTag,
      builder: (context, currentAudioTag) {
        if (currentAudioTag == null) {
          return SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.player);
                },
                child: SizedBox.square(
                  dimension: _playerArtworkSize,
                  child: Stack(
                    children: [
                      QueryArtworkWidget(
                        artworkClipBehavior: Clip.none,
                        artworkHeight: _playerArtworkSize,
                        artworkWidth: _playerArtworkSize,
                        artworkQuality: FilterQuality.high,
                        nullArtworkWidget: buildEmptyArtwork(),
                        size: 200,
                        id: currentAudioTag.id,
                        type: ArtworkType.AUDIO,
                      ),
                      Positioned.fill(child: Container(color: Colors.black26)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocSelector<AudioPlayerCubit, AudioPlayerState, (bool, Duration?)>(
                                selector: (state) => (state.isPlaying, state.position),
                                builder: (context, state) {
                                  final (isPlaying, position) = state;
                                  return isPlaying
                                      ? Text(
                                          formatDuration(position),
                                          style: TextStyle(fontSize: 28, color: Colors.white),
                                        )
                                      : Text(
                                          'Paused',
                                          style: TextStyle(fontSize: 22, color: Colors.white),
                                        );
                                },
                              ),
                              Text(
                                currentAudioTag.title,
                                style: TextStyle(fontSize: 14, color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildEmptyArtwork() {
    return SizedBox.square(dimension: _playerArtworkSize);
  }
}
