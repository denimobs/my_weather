import 'package:flutter/material.dart';

import '../../modules/auth/presentation/pages/splash_screen/splash_screen.dart';
import '../widgets/not_found_page.dart';

abstract class Routes {
  static const initial = '/';
  static const login = '/login';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
