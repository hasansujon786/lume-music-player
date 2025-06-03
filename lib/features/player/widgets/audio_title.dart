import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';
import '../models/audio_tag.dart';

class AudioTitle extends StatefulWidget {
  const AudioTitle({super.key});

  @override
  State<AudioTitle> createState() => _AudioTitleState();
}

class _AudioTitleState extends State<AudioTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
      selector: (state) => state.currentAudioTag,
      builder: (context, audio) {
        return Column(
          spacing: 2,
          children: [
            SizedBox(height: 12),
            Text(
              audio?.title ?? 'No song',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1.4),
            ),
            Text(audio?.artist ?? '', textAlign: TextAlign.center),
            Text(audio?.album ?? '', textAlign: TextAlign.center),
            SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
