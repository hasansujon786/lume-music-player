import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CollectionItem(this.title, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(fontSize: 34, color: Colors.grey.shade900),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
