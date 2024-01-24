import 'dart:ui';

sealed class Device {
  bool get isMobile => this is Smartphone;
  bool get isTablet => this is Tablet;
  bool get isDesktop => this is Desktop;

  static Device fromSize(Size size) {
    return switch (size.shortestSide) {
      < 600 => Smartphone(size),
      < 992 => Tablet(size),
      _ => Desktop(size),
    };
  }

  T fold<T>({
    required T Function(Smartphone) smartphone,
    required T Function(Tablet) tablet,
    required T Function(Desktop) desktop,
  }) {
    return switch (this) {
      Smartphone smartphone_ => smartphone(smartphone_),
      Tablet tablet_ => tablet(tablet_),
      Desktop desktop_ => desktop(desktop_),
    };
  }
}

class Smartphone extends Device {
  Smartphone(this.size);
  final Size size;
}

class Tablet extends Device {
  Tablet(this.size);
  final Size size;
}

class Desktop extends Device {
  Desktop(this.size);
  final Size size;
}
