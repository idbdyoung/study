import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/layout/default_layout.dart';
import 'package:riverpos/model/shopping_item_model.dart';
import 'package:riverpos/riverpod/state_notifier_provider.dart';

class StateNotifierProvider extends ConsumerWidget {
  const StateNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: state.map((e) => Text(e.name)).toList(),
      ),
    );
  }
}
