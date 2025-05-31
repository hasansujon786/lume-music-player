import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.title});
  final String title;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  var player = AudioPlayer();

  void handlePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
    setState(() {});
  }

  void handleSource() async {
    var url = 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3';
    await player.setUrl(url);
    print('handleSource');
    // await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    // print("xxxxxxxxxxxxx");
  }

  String formatDuration(Duration d) {
    final min = d.inMinutes.remainder(60);
    final sec = d.inSeconds.remainder(60);
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
    // await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
  }

  Duration durationTime = Duration.zero;
  Duration currentTime = Duration.zero;
  Duration remainingTime = Duration.zero;
  bool usingSlider = false;
  var seekTime = 0;
  void handleSeekAudio() {}

  @override
  void initState() {
    print('_________________init_________________');
    super.initState();
    handleSource();

    player.durationStream.listen((p) {
      if (p == null) return;
      setState(() => durationTime = p);
    });

    player.positionStream.listen((p) {
      if (usingSlider) return;

      setState(() {
        currentTime = p;
        remainingTime = durationTime - currentTime;
      });
    });

    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          currentTime = Duration.zero;
        });
        player.pause();
        player.seek(currentTime);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              padding: EdgeInsetsGeometry.symmetric(vertical: 4),
              min: 0.0,
              max: durationTime.inSeconds.toDouble(),
              value: currentTime.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() => currentTime = Duration(seconds: value.toInt()));
              },
              onChangeStart: (value) {
                usingSlider = true;
              },
              onChangeEnd: (value) {
                player.seek(Duration(seconds: value.toInt()));
                usingSlider = false;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(formatDuration(currentTime)), SizedBox(width: 12), Text(formatDuration(durationTime))],
            ),
            // TextButton(onPressed: handleSource, child: Text("Load url")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () => player.seek(currentTime - Duration(seconds: 5)), child: Text('-5s')),
                TextButton(onPressed: handlePlayPause, child: Text(player.playing ? 'Pause' : 'play')),
                TextButton(onPressed: () => player.seek(currentTime + Duration(seconds: 5)), child: Text('+5s')),
              ],
            ),
            TextButton(onPressed: () => player.seek(durationTime - Duration(seconds: 5)), child: Text('5s before')),
          ],
        ),
      ),
    );
  }
}
