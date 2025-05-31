import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key, required this.title, this.audio});
  final String title;
  final SongModel? audio;

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
    if (widget.audio?.data != null) {
      print('audio data ==========================================');

      await player.setFilePath(widget.audio!.data);
    }
    // var url = 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3';
    // await player.setUrl(url);
    // await player.setAudioSource(AudioSource.uri(Uri.parse(url)));
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 500),
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
                children: [
                  Text(formatDuration(currentTime)),
                  SizedBox(width: 12),
                  Text(formatDuration(durationTime)),
                ],
              ),
              // TextButton(onPressed: handleSource, child: Text("Load url")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 32,
                    isSelected: false,
                    icon: Icon(Icons.loop_rounded),
                    onPressed: () => player.seek(currentTime - Duration(seconds: 5)),
                  ),
                  IconButton(
                    iconSize: 32,
                    isSelected: false,
                    icon: Icon(Icons.skip_previous_rounded),
                    onPressed: () => player.seek(currentTime - Duration(seconds: 5)),
                  ),
                  IconButton.filled(
                    iconSize: 32,
                    isSelected: player.playing,
                    selectedIcon: Icon(Icons.pause_rounded),
                    icon: Icon(Icons.play_arrow_rounded),
                    onPressed: handlePlayPause,
                    padding: EdgeInsetsGeometry.all(12),
                  ),
                  IconButton(
                    iconSize: 32,
                    isSelected: false,
                    icon: Icon(Icons.skip_next_rounded),
                    onPressed: () => player.seek(currentTime + Duration(seconds: 5)),
                  ),
                  IconButton(
                    iconSize: 32,
                    isSelected: false,
                    icon: Icon(Icons.playlist_play_rounded),
                    onPressed: () => player.seek(currentTime - Duration(seconds: 5)),
                  ),
                ],
              ),
              SizedBox(height: 100),
              TextButton(
                onPressed: () => player.seek(durationTime - Duration(seconds: 5)),
                child: Text('5s before'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
