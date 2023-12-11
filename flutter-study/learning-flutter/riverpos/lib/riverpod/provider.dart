import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/model/shopping_item_model.dart';
import 'package:riverpos/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final shoppingListState = ref.watch(shoppingListProvider);
    final filterListState = ref.watch(filterProvider);

    if (filterListState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterListState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
