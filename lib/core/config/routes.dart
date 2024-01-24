import 'package:flutter/material.dart';

import '../widgets/not_found_page.dart';

abstract class Routes {
  static const initial = '/';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
