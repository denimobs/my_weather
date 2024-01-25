import 'package:flutter/material.dart';

import '../../modules/auth/presentation/pages/login/login_page.dart';
import '../../modules/auth/presentation/pages/splash_screen/splash_screen.dart';
import '../../modules/weather/presentation/pages/weather/weather_page.dart';
import '../widgets/not_found_page.dart';

abstract class Routes {
  static const initial = '/';
  static const home = '/home';
  static const login = '/login';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (_) => const WeatherPage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
