import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';
import '../models/audio_tag.dart';

class NextAudioTitle extends StatelessWidget {
  final double width;
  const NextAudioTitle({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
      selector: (state) => state.currentAudioTag,
      builder: (context, audio) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text('Up next:', style: TextStyle(fontSize: 14)),
                    Text(
                      audio?.title ?? 'No song',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1.4),
                    ),
                    // Text(audio?.album ?? ''),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
