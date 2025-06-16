import 'package:flutter/material.dart';

import '../notifires/scroll_notifire.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -8,
      left: 12,
      child: IgnorePointer(
        child: ValueListenableBuilder<double>(
          valueListenable: scrollOffsetNotifier,
          builder: (context, scrollOffset, _) {
            final parallax = scrollOffset * -40;
            return Transform.translate(
              offset: Offset(parallax, 0),
              child: Text(
                'lume music',
                style: TextStyle(fontSize: 88, color: Colors.grey.shade600, height: 0.9),
              ),
            );
          },
        ),
      ),
    );
  }
}
