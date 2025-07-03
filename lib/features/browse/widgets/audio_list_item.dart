import 'package:flutter/material.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

import '../../../common/widgets/widgets.dart';

class AudioListItem extends StatelessWidget {
  final int? artworkId;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  const AudioListItem({super.key, this.artworkId, required this.title, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        height: AudioListItem.height,
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (artworkId != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: ArtWork(id: artworkId, quality: 200),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.3),
                    textHeightBehavior: TextHeightBehavior(
                      applyHeightToFirstAscent: false,
                      applyHeightToLastDescent: false,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static double get height {
    return 80.0;
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
