import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/routes/routes.dart';
import '../../../common/widgets/no_access_model.dart';
import '../../browse/cubit/media_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.permissions),
            icon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocSelector<MediaCubit, MediaState, bool>(
          selector: (state) => state.hasPermission,
          builder: (context, hasPermission) {
            if (!hasPermission) {
              return NoAccessModel();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.player),
                  child: Text('Open Player'),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.browseSongs),
                  child: Text('Songs'),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.browseArtists),
                  child: Text('Artists'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
