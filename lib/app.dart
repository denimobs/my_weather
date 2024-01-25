import 'package:flutter/material.dart';

import 'core/config/routes.dart';
import 'core/config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Weather App',
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.initial,
      theme: AppTheme.light,
    );
  }
}
