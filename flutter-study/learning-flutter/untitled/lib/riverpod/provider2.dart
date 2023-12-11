import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider2 = Provider(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where(
          (element) => filterState == FilterState.spicy
              ? element.isSpicy
              : !element.isSpicy,
        )
        .toList();
  },
);

enum FilterState {
  spicy,
  notSpicy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
