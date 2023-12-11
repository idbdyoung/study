import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeModifierProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});
