import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/layout/default_layout.dart';
import 'package:untitled/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectProvider.select((value) => value.isSpicy));
    ref.listen(selectProvider.select((value) => value.hasBought), (previous, next) {

    });

    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(state.name),
            // Text(state.isSpicy.toString()),
            // Text(state.hasBought.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: Text('spicy toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: Text('hasbought toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
