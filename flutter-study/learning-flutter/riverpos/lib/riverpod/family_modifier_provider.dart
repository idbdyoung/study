import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider = FutureProvider.family<List<int>, int>(
  (ref, data) async {
    await Future.delayed(
      Duration(seconds: 6),
    );

    return List.generate(5, (index) => index * 5);

    return [1, 2, 3, 4, 5];
  },
);
