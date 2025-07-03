import 'package:flutter/material.dart';

import 'pallete.dart';

class AppTheme {
  static final light = ThemeData(
    iconTheme: IconThemeData(color: Pallete.icon),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
    fontFamily: 'SegoeUI',
  );
}
