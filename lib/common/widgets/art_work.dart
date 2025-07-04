import 'package:flutter/material.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';

class ArtWork extends StatelessWidget {
  final double dimention;
  final double iconSize;
  final int? quality;
  final int? id;
  final bool centerIcon;
  final ArtworkType type;
  const ArtWork({
    super.key,
    this.dimention = 60,
    this.id,
    this.quality,
    this.iconSize = 32,
    this.centerIcon = false,
    this.type = ArtworkType.AUDIO
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimention,
      child: id == null
          ? buildEmptyArtwork()
          : QueryArtworkWidget(
              artworkWidth: dimention,
              artworkHeight: dimention,
              size: quality ?? dimention.toInt(), // quality
              artworkQuality: FilterQuality.high,
              quality: 100,
              nullArtworkWidget: buildEmptyArtwork(),
              artworkClipBehavior: Clip.none,
              id: id!,
              type: type,
            ),
    );
  }

  Widget buildEmptyArtwork() {
    final icon = Icon(Icons.headphones_outlined, size: iconSize, color: Colors.grey.shade50);
    return Container(
      color: Colors.grey.shade300,
      child: centerIcon
          ? icon
          : Stack(
              children: [Positioned(left: iconSize * -0.20, bottom: iconSize * -0.14, child: icon)],
            ),
    );
  }
}
