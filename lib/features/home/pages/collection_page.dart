import 'package:flutter/material.dart';

import '../../../common/routes/routes.dart';
import '../widgets/collection_item.dart';
import '../widgets/page_title.dart';

const separate = 4.0;

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 12),
      children: <Widget>[
        SizedBox(height: 16),
        PageTitle('collection'),
        CollectionItem(
          'artists',
          onPressed: () => Navigator.pushNamed(context, Routes.browseArtists),
        ),
        SizedBox(height: separate),
        CollectionItem(
          'albums',
          onPressed: () => Navigator.pushNamed(context, Routes.browseAlbums),
        ),
        SizedBox(height: separate),
        CollectionItem('songs', onPressed: () => Navigator.pushNamed(context, Routes.browseSongs)),
        SizedBox(height: separate),
        CollectionItem(
          'genres',
          onPressed: () => Navigator.pushNamed(context, Routes.browseGenres),
        ),
        SizedBox(height: separate),
        CollectionItem(
          'playlists',
          onPressed: () => Navigator.pushNamed(context, Routes.browseGenres),
        ),
        SizedBox(height: separate),
        CollectionItem(
          'settings',
          onPressed: () => Navigator.pushNamed(context, Routes.permissions),
        ),
        SizedBox(height: separate),
        CollectionItem('open player', onPressed: () => Navigator.pushNamed(context, Routes.player)),
      ],
    );
  }
}
