import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query_forked/on_audio_query.dart' show ArtworkType;

import '../../../common/theme/styles.dart';
import '../../../common/widgets/widgets.dart';

class AlbumListItem extends StatelessWidget {
  final int? artworkId;
  final String title;
  final String? subtitle;
  final void Function()? onTap;
  final void Function()? onPlayTap;
  const AlbumListItem({
    super.key,
    this.artworkId,
    required this.title,
    this.subtitle,
    this.onTap,
    this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (artworkId != null)
              Stack(
                children: [
                  ArtWork(
                    id: artworkId,
                    quality: 200,
                    dimention: 120,
                    iconSize: 80,
                    type: ArtworkType.ALBUM,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(FluentIcons.play_16_filled),
                      style: Styles.outlinedButton(context, color: Colors.white),
                      onPressed: onPlayTap,
                    ),
                  ),
                ],
              ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
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
}
