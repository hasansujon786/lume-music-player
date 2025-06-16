import 'package:flutter/material.dart';

import '../../player/widgets/next_audio_title.dart';
import '../../player/widgets/player_slider.dart';
import '../../player/widgets/playlist_controlls.dart';
import '../../player/widgets/widgets.dart';
import '../widgets/page_title.dart';

class NowPlayingPage extends StatelessWidget {
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    double playerWidth = screenWidth * 0.70;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 16),
          PageTitle('now playing'),
          AudioTitle(width: playerWidth + 32),
          Row(
            children: [
              PlayerArtWork(width: playerWidth),
              PlaylistControlls(width: playerWidth),
            ],
          ),
          PlayerSlider(width: playerWidth),
          NextAudioTitle(width: playerWidth + 12),
          SizedBox(height: 8),
          PlayerMainControlls(width: playerWidth),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
