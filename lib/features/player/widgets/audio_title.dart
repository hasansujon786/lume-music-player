import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusic/features/player/cubit/audio_player_cubit.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class AudioTitle extends StatelessWidget {
  const AudioTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AudioPlayerCubit, AudioPlayerState, SongModel?>(
      selector: (state) => state.audio,
      builder: (context, audio) {
        return Column(
          children: [
            SizedBox(height: 16),
            Text(
              audio?.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1.4),
            ),
            SizedBox(height: 8),
            Text(audio?.artist ?? '', textAlign: TextAlign.center),
            SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
