import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/layout/default_layout.dart';
import 'package:riverpos/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(5));

    return DefaultLayout(
        title: 'fmaily modifier',
        body: Center(
          child: state.when(
            data: (data) => Text(data.toString()),
            error: (err, stack) => Text(err.toString()),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
