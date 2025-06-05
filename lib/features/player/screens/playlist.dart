import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../browse/widgets/audio_list_item.dart';
import '../cubit/audio_player_cubit.dart';
import '../models/audio_tag.dart';

class PlaylistParams {
  final int? currentIndex;
  const PlaylistParams({this.currentIndex});
}

class Playlist extends StatefulWidget {
  final PlaylistParams params;
  const Playlist({super.key, required this.params});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.params.currentIndex != null) {
        _scrollController.jumpTo(widget.params.currentIndex! * _itemHeight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Playlist')),
      body: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
        buildWhen: (oldState, newState) => false,
        builder: (context, state) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.playlist.length,
            itemBuilder: (context, index) {
              return Item(
                index: index,
                audio: state.playlist[index],
                onTap: () {
                  var playIndex = index;
                  if (state.shuffleModeEnabled) {
                    playIndex = context.read<AudioPlayerCubit>().shuffleIndices[index];
                  }
                  context.read<AudioPlayerCubit>().selectAudioWithIndex(playIndex);
                  context.read<AudioPlayerCubit>().play();
                },
              );
            },
          );
        },
      ),
    );
  }
}

const _itemHeight = 70.0;

class Item extends StatelessWidget {
  final int index;
  final AudioTag audio;
  final void Function()? onTap;
  const Item({super.key, required this.index, required this.audio, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _itemHeight,
      child: ListTile(
        leading: ListArtwork(id: audio.id),
        title: Text(
          audio.title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          audio.artist ?? 'Unknown',
          style: TextStyle(fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: BlocSelector<AudioPlayerCubit, AudioPlayerState, int?>(
          selector: (state) => state.currentSequenceIndex,
          builder: (context, currentSequenceIndex) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                currentSequenceIndex == index
                    ? Icon(Icons.play_arrow_rounded)
                    : Icon(Icons.remove, color: Colors.grey.shade300),
                Icon(Icons.menu, color: Colors.grey.shade400),
              ],
            );
          },
        ),
        onTap: onTap,
      ),
    );
  }
}
