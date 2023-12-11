import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/layout/default_layout.dart';
import 'package:riverpos/riverpod/steam_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(multipleSteamProvider);

    return DefaultLayout(
        title: 'StreamProvider',
        body: Center(
          child: state.when(
            data: (data) => Text(data.toString()),
            error: (err, stack) {
              err.toString();
            },
            loading:() => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
