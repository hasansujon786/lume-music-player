import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/routes/route_generator.dart';
import 'common/routes/routes.dart';
import 'features/browse/cubit/media_cubit.dart';
import 'features/browse/cubit/songs_by_album_cubit.dart';
import 'features/browse/cubit/songs_by_artist_cubit.dart';
import 'features/browse/cubit/songs_by_genre_cubit.dart';
import 'features/player/cubit/audio_player_cubit.dart';
import 'features/setting/cubit/settings_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AudioPlayerCubit>(create: (context) => AudioPlayerCubit()),
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
        BlocProvider<MediaCubit>(create: (context) => MediaCubit(AudioQueryManager().audioQuery)),
        BlocProvider<SongsByArtistCubit>(create: (context) => SongsByArtistCubit(AudioQueryManager().audioQuery)),
        BlocProvider<SongsByAlbumCubit>(create: (context) => SongsByAlbumCubit(AudioQueryManager().audioQuery)),
        BlocProvider<SongsByGenreCubit>(create: (context) => SongsByGenreCubit(AudioQueryManager().audioQuery)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lume music player',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'SegoeUI'
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: Routes.landing,
      ),
    );
  }
}
