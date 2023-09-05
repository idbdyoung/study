import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/riverpod/state_notifier_provider.dart';

final filteredShoppingList2Provider = Provider(
  (ref) {
    final filterState = ref.watch(filterSpicyProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterSpicyState.all) {
      return shoppingListState;
    }

    return shoppingListState.where((element) =>
        filterState == FilterSpicyState.spicy
            ? element.isSpicy
            : !element.isSpicy);
  },
);

enum FilterSpicyState {
  notSpicy,
  spicy,
  all,
}

final filterSpicyProvider =
    StateProvider<FilterSpicyState>((ref) => FilterSpicyState.all);
