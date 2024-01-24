import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/config/routes.dart';
import '../../../../../core/utils/extensions/build_context.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  void loadApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    if (!context.mounted) return;
    context.navigator.pushReplacementNamed(Routes.login);
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      loadApp(context);
      return null;
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading app...'),
          ],
        ),
      ),
    );
  }
}
