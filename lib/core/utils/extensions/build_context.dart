import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
