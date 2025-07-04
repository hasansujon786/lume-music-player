import 'package:flutter/material.dart';

class Styles {
  static const buttonBorderSize = 2.0;
  static final buttonIconSize = 18.0;

  static outlinedButton(BuildContext context, {Color? color}) {
    final iconActiveColor = IconTheme.of(context).color!;

    return IconButton.styleFrom(
      foregroundColor: color,
      minimumSize: Size.square(10),
      fixedSize: Size.square(34),
      iconSize: Styles.buttonIconSize,
      side: BorderSide(width: Styles.buttonBorderSize, color: color ?? iconActiveColor),
    );
  }
}
