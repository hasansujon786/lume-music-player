import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../common/routes/routes.dart';
import '../cubit/audio_player_cubit.dart';

class PlayerMainControlls extends StatelessWidget {
  const PlayerMainControlls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: buildLoopIcon(state.loopMode),
                  onPressed: () => context.read<AudioPlayerCubit>().toggleRepeatMode(),
                ),
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(Icons.skip_previous_rounded),
                  onPressed: () => context.read<AudioPlayerCubit>().prev(),
                ),
                IconButton.filled(
                  iconSize: 32,
                  isSelected: state.isPlaying,
                  selectedIcon: Icon(Icons.pause_rounded),
                  icon: Icon(Icons.play_arrow_rounded),
                  onPressed: () => context.read<AudioPlayerCubit>().toggle(),
                  padding: EdgeInsetsGeometry.all(12),
                ),
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(Icons.skip_next_rounded),
                  onPressed: () => context.read<AudioPlayerCubit>().next(),
                ),
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(
                    state.shuffleModeEnabled ? Icons.shuffle_on_rounded : Icons.shuffle_rounded,
                  ),
                  onPressed: () => context.read<AudioPlayerCubit>().toggleShuffle(),
                ),
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: [
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(Icons.playlist_play_rounded),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      Routes.playlist,
                      arguments: PlaylistParams(currentIndex: state.currentSequenceIndex),
                    );
                  },
                ),
                // TextButton(
                //   onPressed: () {
                //     // context.read<AudioPlayerCubit>().seek(state.duration - Duration(seconds: 5));
                //   },
                //   child: Text('5s to end'),
                // ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildLoopIcon(LoopMode mode) {
    switch (mode) {
      case LoopMode.off:
        return Icon(Icons.report_off_outlined);
      case LoopMode.one:
        return Icon(Icons.repeat_one_rounded);
      default:
        return Icon(Icons.repeat_rounded);
    }
  }
}
