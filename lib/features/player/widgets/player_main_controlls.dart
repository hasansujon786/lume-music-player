import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';

class PlayerMainControlls extends StatelessWidget {
  final double width;
  const PlayerMainControlls({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: -8,
            child: IconButton(
              iconSize: 22,
              icon: IconWithBorder(Icon(FluentIcons.rewind_24_filled)),
              onPressed: () => context.read<AudioPlayerCubit>().prev(),
            ),
          ),
          BlocSelector<AudioPlayerCubit, AudioPlayerState, bool>(
            selector: (state) => state.isPlaying,
            builder: (context, isPlaying) {
              return IconButton(
                iconSize: 22,
                icon: isPlaying
                    ? IconWithBorder(Icon(Icons.pause_rounded, size: 30), padding: 6)
                    : IconWithBorder(Icon(FluentIcons.play_24_filled)),
                onPressed: () => context.read<AudioPlayerCubit>().toggle(),
              );
            },
          ),
          Positioned(
            right: -8,
            child: IconButton(
              iconSize: 22,
              icon: IconWithBorder(Icon(FluentIcons.fast_forward_24_filled)),
              onPressed: () => context.read<AudioPlayerCubit>().next(),
            ),
          ),
        ],
      ),
    );
  }
}

class IconWithBorder extends StatelessWidget {
  final Widget icon;
  final double padding;
  const IconWithBorder(this.icon, {super.key, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(padding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: IconTheme.of(context).color ?? Colors.black, width: 2),
      ),
      child: icon,
    );
  }
}
