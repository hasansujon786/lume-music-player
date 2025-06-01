import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Player'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              PlayerArtWork(),
              AudioTitle(),
              PlayerMainControlls(),
            ],
          ),
        ),
      ),
    );
  }
}
