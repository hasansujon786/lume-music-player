import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/no_access_model.dart';
import '../../browse/cubit/media_cubit.dart';
import '../../player/cubit/audio_player_cubit.dart';
import '../../player/models/audio_tag.dart';
import '../notifires/scroll_notifire.dart';
import '../pages/collection_page.dart';
import '../pages/history_page.dart';
import '../pages/new_songs_page.dart';
import '../pages/now_playing_page.dart';
import '../widgets/top_banner.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocSelector<MediaCubit, MediaState, bool?>(
          selector: (state) => state.hasPermission,
          builder: (context, hasPermission) {
            if (hasPermission == null) {
              return SizedBox();
            }
            if (!hasPermission) {
              return NoAccessModel();
            }
            // return SizedBox();
            return MainPageView();
          },
        ),
      ),
    );
  }
}

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  // Scroll positon
  double? _baseOffset;

  @override
  Widget build(BuildContext context) {
    const double peekAmount = 32;
    final size = MediaQuery.sizeOf(context);
    final double screenWidth = size.width;
    final double viewportFraction = (screenWidth - peekAmount) / screenWidth;

    return Stack(
      children: [
        TopBanner(),
        Positioned.fill(
          top: 80,
          bottom: 22,
          child: BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
            selector: (state) => state.currentAudioTag,
            builder: (context, currentTrack) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: size.height,
                  viewportFraction: viewportFraction,
                  enableInfiniteScroll: false, // loop
                  enlargeCenterPage: false, // aligns left
                  padEnds: false, // left-align first item
                  scrollPhysics: const PageScrollPhysics(),
                  onScrolled: (val) {
                    if (val == null) return;
                    _baseOffset ??= val;
                    scrollOffsetNotifier.value = val;
                  },
                ),

                items: [
                  if (currentTrack != null) NowPlayingPage(),
                  CollectionPage(),
                  HistoryPage(),
                  NewSongsPage(),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(width: double.infinity, height: 22, color: Colors.grey.shade300),
        ),
      ],
    );
  }
}
