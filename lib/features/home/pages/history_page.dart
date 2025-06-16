import 'package:flutter/material.dart';

import '../widgets/page_title.dart';

const separate = 4.0;

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(right: 8, left: 16),
      children: <Widget>[
        SizedBox(height: 16),
        PageTitle('History'),
        SizedBox(height: separate),
      ],
    );
  }
}
