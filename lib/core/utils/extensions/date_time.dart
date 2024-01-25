import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  /// abbr. weekday name, abbr. month name and day of month (e.g. Wed, Sep 1)
  // ignore: non_constant_identifier_names
  String get MMMEd => DateFormat.MMMEd().format(this);

  bool get isDay => hour >= 6 && hour < 18;
  bool get isNight => !isDay;
}
