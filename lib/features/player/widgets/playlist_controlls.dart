import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../common/routes/routes.dart';
import '../../../common/theme/pallete.dart';
import '../cubit/audio_player_cubit.dart';

class PlaylistControlls extends StatelessWidget {
  final double width;
  const PlaylistControlls({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final iconActiveColor = IconTheme.of(context).color;
    final iconDisableColor = Pallete.iconDisabled;

    return BlocSelector<AudioPlayerCubit, AudioPlayerState, (LoopMode, bool)>(
      selector: (state) => (state.loopMode, state.shuffleModeEnabled),
      builder: (context, state) {
        final (loopMode, shuffleModeEnabled) = state;
        return SizedBox(
          height: width,
          width: 50,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                top: -10,
                right: 0,
                child: IconButton(
                  iconSize: 24,
                  icon: Icon(
                    Icons.shuffle_rounded,
                    color: shuffleModeEnabled ? iconActiveColor : iconDisableColor,
                  ),
                  onPressed: () => context.read<AudioPlayerCubit>().toggleShuffle(),
                ),
              ),
              Positioned(
                top: 50,
                right: 0,
                child: IconButton(
                  iconSize: 24,
                  isSelected: false,
                  icon: buildLoopIcon(loopMode, iconDisableColor, iconActiveColor),
                  onPressed: () => context.read<AudioPlayerCubit>().toggleRepeatMode(),
                ),
              ),
              Positioned(
                bottom: -10,
                right: 0,
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.playlist_play_rounded),
                  onPressed: () {
                    final playlistIndex = context
                        .read<AudioPlayerCubit>()
                        .state
                        .currentSequenceIndex;

                    Navigator.of(context).pushNamed(
                      Routes.playlist,
                      arguments: PlaylistParams(currentIndex: playlistIndex),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildLoopIcon(LoopMode mode, Color color, Color? activeColor) {
    switch (mode) {
      case LoopMode.off:
        return Icon(Icons.repeat_rounded, color: color);
      case LoopMode.one:
        return Icon(Icons.repeat_one_rounded, color: activeColor);
      default:
        return Icon(Icons.repeat_rounded, color: activeColor);
    }
  }
}
