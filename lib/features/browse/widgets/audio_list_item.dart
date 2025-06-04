import 'package:flutter/material.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class AudioListItem extends StatelessWidget {
  final int artworkId;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  const AudioListItem({
    super.key,
    required this.artworkId,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      // onTap: () async {
      //   context.read<MediaByArtistCubit>().loadSongsForArtist(items[index].id);
      //   Navigator.of(context).pushNamed(Routes.songsByArtist);
      // },
      title: Text(title),
      subtitle: Text(subtitle ?? ''),
      leading: ListArtwork(id: artworkId),
    );
  }
}

class ListArtwork extends StatelessWidget {
  final int id;
  const ListArtwork({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: QueryArtworkWidget(
        artworkClipBehavior: Clip.none,
        // controller: _audioQuery,
        id: id,
        type: ArtworkType.AUDIO,
      ),
    );
  }
}
