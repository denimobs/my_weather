import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/config/env.dart';
import '../../../../../core/config/routes.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../../core/widgets/error_dialog.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  bool verifyEnvIntegrity(BuildContext context) {
    final missingKeys = Env.verifyFileIntegrity();
    if (missingKeys.isEmpty) return true;

    ErrorDialog.show(
      context: context,
      title: 'Missing environment variables',
      message: missingKeys.map((e) => '• $e').join('\n'),
      onOk: () => SystemNavigator.pop(),
    );

    return false;
  }

  void loadApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;

    final envLoaded = verifyEnvIntegrity(context);
    if (!envLoaded) return;

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
