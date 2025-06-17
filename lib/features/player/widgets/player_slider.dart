import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';

class PlayerSlider extends StatelessWidget {
  final double width;
  const PlayerSlider({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        builder: (context, state) {
          Duration? position = state.position;
          Duration? totalDuration = state.duration;

          return ProgressBar(
            progress: position ?? Duration.zero,
            total: totalDuration ?? Duration.zero,
            onSeek: (position) {
              context.read<AudioPlayerCubit>().seek(position);
            },
            // Customize the appearance of the progress bar
            barHeight: 5,
            thumbRadius: 2.5,
            thumbGlowRadius: 5,
            timeLabelLocation: TimeLabelLocation.sides,
            timeLabelPadding: 0,
            timeLabelTextStyle: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          );
        },
      ),
    );
  }
}
