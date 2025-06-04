import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/browse/cubit/media_cubit.dart';

class NoAccessModel extends StatelessWidget {
  const NoAccessModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          border: BoxBorder.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 6),
            const Text(
              "Application doesn't have access to the library",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 18),
            FilledButton.tonal(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.greenAccent.shade200),
              ),
              onPressed: () {
                context.read<MediaCubit>().checkAndRequestPermissions(retry: true);
              },
              child: const Text('Allow'),
            ),
          ],
        ),
      ),
    );
  }
}
