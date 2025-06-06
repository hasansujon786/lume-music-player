import 'package:flutter/material.dart';

class TopBanner extends StatefulWidget {
  final PageController pageController;
  const TopBanner({super.key, required this.pageController});

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  late final VoidCallback _listener;
  double _page = 0.0;

  @override
  void initState() {
    super.initState();
    _listener = () {
      setState(() => _page = widget.pageController.page ?? 0.0);
    };
    widget.pageController.addListener(_listener);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double parallax = _page * -40; // speed

    return Positioned(
      top: -8,
      left: 12,
      child: IgnorePointer(
        child: Transform.translate(
          offset: Offset(parallax, 0),
          child: Text(
            'lume music',
            style: TextStyle(fontSize: 88, color: Colors.grey.shade600, height: 0.9),
          ),
        ),
      ),
    );
  }
}
