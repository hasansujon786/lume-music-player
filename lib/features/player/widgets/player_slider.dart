import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';

String formatDuration(Duration d) {
  final min = d.inMinutes.remainder(60);
  final sec = d.inSeconds.remainder(60);
  return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
}

class PlayerSlider extends StatefulWidget {
  const PlayerSlider({super.key});

  @override
  State<PlayerSlider> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends State<PlayerSlider> {
  var usingSlider = false;
  var sliderValue = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Slider(
              padding: EdgeInsetsGeometry.symmetric(vertical: 4),
              min: 0.0,
              max: state.duration.inSeconds.toDouble(),
              value: usingSlider
                  ? sliderValue.inSeconds.toDouble()
                  : state.position.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() => sliderValue = Duration(seconds: value.toInt()));
              },
              onChangeStart: (value) {
                usingSlider = true;
              },
              onChangeEnd: (value) {
                context.read<AudioPlayerCubit>().seek(Duration(seconds: value.toInt()));
                usingSlider = false;
                sliderValue = Duration.zero;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(state.position)),
                SizedBox(width: 12),
                Text(formatDuration(state.duration)),
              ],
            ),
            // SizedBox(height: 100),
          ],
        );
      },
    );
  }
}
