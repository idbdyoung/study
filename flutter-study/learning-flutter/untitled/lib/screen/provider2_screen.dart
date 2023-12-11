import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/layout/default_layout.dart';
import 'package:untitled/riverpod/provider2.dart';
import 'package:untitled/riverpod/state_notifier_provider.dart';

class Provider2Screen extends ConsumerWidget {
  const Provider2Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider2);

    return DefaultLayout(
      title: 'Provider2Screen',
      actions: [
        PopupMenuButton(
          itemBuilder: (_) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
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
            .toList(),
      ),
    );
  }
}
