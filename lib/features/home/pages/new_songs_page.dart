import 'package:flutter/material.dart';

import '../widgets/page_title.dart';

const separate = 4.0;

class NewSongsPage extends StatelessWidget {
  const NewSongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 12),
      children: <Widget>[
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: PageTitle('New'),
        ),
        SizedBox(height: separate),
      ],
    );
  }
}
