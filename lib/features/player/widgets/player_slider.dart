import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/utils/utils.dart';
import '../cubit/audio_player_cubit.dart';

double _getSliderValue(
  Duration? position,
  Duration? duration,
  bool usingSlider,
  Duration sliderValue,
) {
  if (usingSlider) {
    return sliderValue.inSeconds.toDouble();
  }
  return position != null && duration != null
      ? position.inSeconds.clamp(0, duration.inSeconds).toDouble()
      : 0.0;
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
              max: state.duration?.inSeconds.toDouble() ?? 1,
              value: _getSliderValue(state.position, state.duration, usingSlider, sliderValue),
              onChanged: (value) {
                setState(() => sliderValue = Duration(seconds: value.toInt()));
              },
              onChangeStart: (value) {
                sliderValue = state.position!;
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
                Text(formatDuration(usingSlider ? sliderValue : state.position)),
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
