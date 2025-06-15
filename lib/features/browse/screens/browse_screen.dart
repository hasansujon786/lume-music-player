import 'package:flutter/material.dart';

import '../pages/album_list_page.dart';
import '../pages/song_list_page.dart';
import '../pages/genre_list_page.dart';
import '../pages/artist_list_page.dart';

const titleGap = 0.0;
const titleRowHeight = 60.0;
final titleColor = Colors.grey.shade500;
final titleActiveColor = Colors.black;

class BrowseScreenParams {
  final int initialPageIndex;
  const BrowseScreenParams({required this.initialPageIndex});
}

class BrowseScreen extends StatefulWidget {
  final BrowseScreenParams? params;
  const BrowseScreen({super.key, this.params});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> with SingleTickerProviderStateMixin {
  final categories = [
    'genres',
    'artists',
    'albums',
    'songs',
    'genres',
    // 'playlists',
    // middle
    'artists',
    'albums',
    'songs',
    'genres',
    // 'playlists',
  ];
  final categoryCount = 4;
  bool zeroIndexCategoryAdded = false;
  double xOffsetTitle = 0;
  double? lastTitleXOffset;
  double? firstTitleXOffset;
  List<RenderBoxInfo?> allTitleBoxInfo = [];
  final Map<int, GlobalKey> _itemKeys = {for (int i = 0; i < 10; i++) i: GlobalKey()};
  late Animation<double> _titleOffsetXAnimation;
  late final Animation<Color?> _colorAnimation = ColorTween(
    begin: titleColor,
    end: titleActiveColor,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  RenderBoxInfo? getBoxPositon(index) {
    final key = _itemKeys[index];
    final ctx = key?.currentContext;
    if (ctx != null) {
      final box = ctx.findRenderObject() as RenderBox;
      final dx = box.localToGlobal(Offset.zero).dx;
      return RenderBoxInfo(box.size.width, dx);
    }

    return null;
  }

  void saveAllTitleBoxPositions(int initialIndex) {
    final info = getBoxPositon(initialIndex + 1);
    setState(() {
      xOffsetTitle = -((info?.dx ?? 0) - safePaddingLeft);
    });

    if (!zeroIndexCategoryAdded) {
      for (var i = 0; i < categoryCount; i++) {
        final info = getBoxPositon(i + 1);

        if (info != null) {
          allTitleBoxInfo.add(info);
        }
      }
      firstTitleXOffset = (allTitleBoxInfo.first?.dx ?? 0) - safePaddingLeft;
      lastTitleXOffset = (allTitleBoxInfo.last?.dx ?? 0) - safePaddingLeft;

      zeroIndexCategoryAdded = true;
    }
  }

  double xOffset = -1;
  double screenWidth = 0.0;
  double safePaddingLeft = 0.0;
  int currentIndex = -1;
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );
  late Animation<double> _pageOffsetXanimation;

  double xOffsetPercent = 0.0;
  double xOffsetPercentTemp = 0.0;
  bool didScrolledHalfway = false;
  int didScrolledDirection = 0;
  void _resetScrollState() {
    didScrolledHalfway = false;
    didScrolledDirection = 0;
    xOffsetPercent = 0.0;
    xOffsetPercentTemp = 0.0;
  }

  int realIndex(int index) => (index % categoryCount + categoryCount) % categoryCount;

  final List<Widget> items = [
    ArtistListPage(key: ValueKey('ArtistListPage')),
    AlbumListPage(key: ValueKey('AlbumListPage')),
    SongsListPage(key: ValueKey('SongsListPage')),
    GenresListPage(key: ValueKey('GenresListPage')),
  ];

  void lazyLoadWidgets() {
    final widgets = [];

    for (final wid in widgets) {
      items.add(wid);
    }
  }

  @override
  void initState() {
    currentIndex = widget.params?.initialPageIndex ?? 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      saveAllTitleBoxPositions(currentIndex);
      // lazyLoadWidgets();
    });

    super.initState();

    _controller.addListener(() {
      // print('_animation ${_animation.value}');
      setState(() {
        xOffset = _pageOffsetXanimation.value;
        xOffsetTitle = _titleOffsetXAnimation.value;
      });
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && didScrolledHalfway) {
        if (didScrolledDirection == -1) {
          xOffset = screenWidth;
          currentIndex = realIndex(currentIndex + 1);
        } else if (didScrolledDirection == 1) {
          xOffset = -screenWidth;
          currentIndex = realIndex(currentIndex - 1);
        }

        // reset offset if the new category is first or last item
        if (currentIndex == 0) {
          xOffsetTitle = -(firstTitleXOffset ?? 0);
        } else if (currentIndex == categoryCount - 1) {
          xOffsetTitle = -(lastTitleXOffset ?? 0);
        }

        // Slide in new item
        animateToOffset(0, titleTarget: xOffsetTitle);
        _resetScrollState();
      }
    });
  }

  void animateToOffset(double target, {double? titleTarget}) {
    _pageOffsetXanimation = Tween<double>(
      begin: xOffset,
      end: target,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (titleTarget != null) {
      _titleOffsetXAnimation = Tween<double>(
        begin: xOffsetTitle,
        end: titleTarget,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    }

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    safePaddingLeft = MediaQuery.paddingOf(context).left;
    safePaddingLeft = MediaQuery.paddingOf(context).left;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanStart: (details) {
            _resetScrollState();
            xOffsetPercentTemp = xOffsetTitle;
          },
          onPanUpdate: (details) {
            setState(() {
              xOffset += details.delta.dx;
              xOffsetPercent += details.delta.dx / screenWidth;

              final titleWidth = allTitleBoxInfo[currentIndex]?.width ?? 0;
              xOffsetTitle = xOffsetPercentTemp + (xOffsetPercent * titleWidth);

              // print('xOffsetPercent $xOffsetPercent');
              // categoryScrollX = -(categoryScrollX.abs() + dx);
            });
          },
          onPanEnd: (details) {
            final velocityX = details.velocity.pixelsPerSecond.dx;
            final scrolledFarEnough = xOffset.abs() >= screenWidth / 2;
            final swipedFastEnough = velocityX.abs() > 400; // Threshold velocity

            if (scrolledFarEnough || swipedFastEnough) {
              // Scroll out completely in the direction of the swipe
              double target = xOffset > 0 ? screenWidth : -screenWidth;
              double titleTarget = 0.0;
              didScrolledHalfway = true;

              if (target > 0) {
                didScrolledDirection = 1;
                final titleWidth = allTitleBoxInfo[realIndex(currentIndex - 1)]?.width ?? 0;
                titleTarget = xOffsetPercentTemp + (titleWidth + titleGap); // gap
              } else {
                didScrolledDirection = -1;
                final titleWidth = allTitleBoxInfo[currentIndex]?.width ?? 0;
                titleTarget = xOffsetPercentTemp - (titleWidth + titleGap); // gap
              }

              animateToOffset(target, titleTarget: titleTarget);
            } else {
              animateToOffset(0, titleTarget: xOffsetPercentTemp);
              _resetScrollState();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('MUSIC', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),)
              ),
              SizedBox(
                height: titleRowHeight,
                width: screenWidth,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Transform.translate(
                        offset: Offset(xOffsetTitle, 0),
                        child: Row(
                          spacing: titleGap,
                          children: [
                            for (var i = 0; i < categories.length; i++)
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  ' ${categories[i]}',
                                  key: _itemKeys[i],
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: (currentIndex + 1 == i)
                                        ? _colorAnimation.isAnimating
                                              ? _colorAnimation.value
                                              : titleActiveColor
                                        : (i < currentIndex + 1)
                                        ? titleColor
                                        : (i > currentIndex + 1) &&
                                              (i <= currentIndex + categoryCount)
                                        ? titleColor
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // if (lastTitleXOffset != null)
                    //   Positioned(
                    //     top: 0,
                    //     left: (lastTitleXOffset ?? 0) + 2,
                    //     child: Container(
                    //       height: titleRowHeight,
                    //       width: screenWidth,
                    //       color: bgColor,
                    //     ),
                    //   ),
                  ],
                ),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(xOffset, 0),
                  child: IndexedStack(index: currentIndex, children: items),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RenderBoxInfo {
  final double dx;
  final double width;
  const RenderBoxInfo(this.width, this.dx);

  @override
  String toString() {
    return 'width $width,dx $dx';
  }
}
