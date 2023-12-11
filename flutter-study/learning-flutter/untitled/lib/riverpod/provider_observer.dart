import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    // TODO: implement didUpdateProvider
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}