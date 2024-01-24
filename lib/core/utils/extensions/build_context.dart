import 'package:flutter/material.dart';

import '../device.dart';

extension BuildContextX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get size => MediaQuery.of(this).size;
  Device get deviceType => Device.fromSize(size);
}
