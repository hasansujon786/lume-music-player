import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/no_access_model.dart';
import '../../browse/cubit/media_cubit.dart';
import '../../player/cubit/audio_player_cubit.dart';
import '../../player/models/audio_tag.dart';
import '../pages/collection_page.dart';
import '../pages/history_page.dart';
import '../pages/new_songs_page.dart';
import '../pages/now_playing_page.dart';
import '../widgets/top_banner.dart';

const double _peekAmount = 52;

class HomeScreen extends StatelessWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double viewportFraction = (screenWidth - _peekAmount) / screenWidth;

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
            return MainPageView(viewportFraction: viewportFraction);
          },
        ),
      ),
    );
  }
}

class MainPageView extends StatefulWidget {
  final double viewportFraction;
  const MainPageView({super.key, required this.viewportFraction});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: widget.viewportFraction);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopBanner(pageController: _pageController),
        Positioned.fill(
          top: 80,
          left: -16,
          bottom: 22,
          child: BlocSelector<AudioPlayerCubit, AudioPlayerState, AudioTag?>(
            selector: (state) => state.currentAudioTag,
            builder: (context, currentTrack) {
              return PageView(
                controller: _pageController,
                children: [
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
