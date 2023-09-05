import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/layout/default_layout.dart';
import 'package:riverpos/riverpod/provider.dart';
import 'package:riverpos/riverpod/provider2.dart';
import 'package:riverpos/riverpod/state_notifier_provider.dart';

class Provider2Screen extends ConsumerWidget {
  const Provider2Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingList2Provider);

    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton(
          itemBuilder: (_) => FilterSpicyState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onSelected: (value) {
            ref.read(filterSpicyProvider.notifier).update((state) => value);
          },
        ),
      ],
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
              .toList()),
    );
  }
}
