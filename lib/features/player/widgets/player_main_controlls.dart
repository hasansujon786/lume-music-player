import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusic/features/player/cubit/audio_player_cubit.dart';

String formatDuration(Duration d) {
  final min = d.inMinutes.remainder(60);
  final sec = d.inSeconds.remainder(60);
  return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
}

class PlayerMainControlls extends StatefulWidget {
  const PlayerMainControlls({super.key});

  @override
  State<PlayerMainControlls> createState() => _PlayerMainControllsState();
}

class _PlayerMainControllsState extends State<PlayerMainControlls> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(Icons.loop_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(Icons.skip_previous_rounded),
                  onPressed: () =>
                      context.read<AudioPlayerCubit>().seek(state.position - Duration(seconds: 5)),
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
                  onPressed: () =>
                      context.read<AudioPlayerCubit>().seek(state.position + Duration(seconds: 5)),
                ),
                IconButton(
                  iconSize: 32,
                  isSelected: false,
                  icon: Icon(Icons.playlist_play_rounded),
                  onPressed: () {},
                ),
              ],
            ),
            // SizedBox(height: 100),
            TextButton(
              onPressed: () =>
                  context.read<AudioPlayerCubit>().seek(state.duration - Duration(seconds: 5)),
              child: Text('5s before'),
            ),
          ],
        );
      },
    );
  }
}
