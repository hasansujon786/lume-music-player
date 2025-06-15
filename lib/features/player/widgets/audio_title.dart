import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/audio_player_cubit.dart';
import '../models/audio_tag.dart';

class AudioTitle extends StatefulWidget {
  final double width;
  const AudioTitle({super.key, required this.width});

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
        return SizedBox(
          width: widget.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                audio?.title ?? 'No song',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, height: 1.4),
              ),
              Text(
                audio?.artist != null ? 'by ${audio?.artist}' : '',
                style: TextStyle(fontSize: 16),
              ),
              // Text(audio?.album ?? ''),
            ],
          ),
        );
      },
    );
  }
}
