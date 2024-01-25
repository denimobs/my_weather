import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'loading_page.dart';

class LoadingWrapper extends ConsumerWidget {
  const LoadingWrapper({
    super.key,
    required this.child,
    this.providers = const [],
  });

  final Widget child;
  final List<ProviderListenable<AsyncValue>> providers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    for (var provider in providers) {
      final state = ref.watch(provider);
      if (!state.isLoading) continue;

      return Stack(
        children: [
          child,
          const LoadingPage(),
        ],
      );
    }

    return child;
  }
}
