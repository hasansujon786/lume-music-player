import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../cubit/audio_player_cubit.dart';

class AudioTitle extends StatefulWidget {
  const AudioTitle({super.key});

  @override
  State<AudioTitle> createState() => _AudioTitleState();
}

class _AudioTitleState extends State<AudioTitle> {
  final _audioPlayer = AudioPlayerManager().player;

  var titleTag = 'No song';

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState.currentSource?.tag != null) {
        setState(() {
          titleTag = sequenceState.currentSource?.tag;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _listenForChangesInSequenceState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AudioPlayerCubit, AudioPlayerState, SongModel?>(
      selector: (state) => state.audio,
      builder: (context, audio) {
        return Column(
          children: [
            SizedBox(height: 16),
            Text(
              audio?.title ?? titleTag,
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
