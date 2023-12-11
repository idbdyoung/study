import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/layout/default_layout.dart';
import 'package:untitled/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen2 extends ConsumerWidget {
  const StateNotifierProviderScreen2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingListProvider);

    return DefaultLayout(
        title: 'StateNotifierProvider',
        body: ListView(
          children: state
              .map(
                (e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    ref
                        .read(shoppingListProvider.notifier)
                        .toggleHasBought(name: e.name);
                  },
                ),
              )
              .toList(),
        ));
  }
}
