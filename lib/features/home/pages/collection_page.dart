import 'package:flutter/material.dart';

import '../../../common/routes/routes.dart';
import '../widgets/collection_item.dart';
import '../widgets/now_playing_tag.dart';
import '../widgets/page_title.dart';

const separate = 4.0;

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  void nav(BuildContext context, int initialPageIndex) {
    Navigator.pushNamed(
      context,
      Routes.browse,
      arguments: BrowseScreenParams(initialPageIndex: initialPageIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 12),
      children: <Widget>[
        SizedBox(height: 16),
        PageTitle('collection'),
        NowPlayingTag(),
        CollectionItem('artists', onPressed: () => nav(context, 0)),
        SizedBox(height: separate),
        CollectionItem('albums', onPressed: () => nav(context, 1)),
        SizedBox(height: separate),
        CollectionItem('songs', onPressed: () => nav(context, 2)),
        SizedBox(height: separate),
        CollectionItem('genres', onPressed: () => nav(context, 3)),
        SizedBox(height: separate),
        // CollectionItem(
        //   'playlists',
        //   onPressed: () => Navigator.pushNamed(context, Routes.browseGenres),
        // ),
        SizedBox(height: separate),
        // CollectionItem(
        //   'Test',
        //   onPressed: () => Navigator.pushNamed(context, '/test', arguments: BrowseScreenParams(initialPageIndex: 1)),
        // ),
      ],
    );
  }
}
