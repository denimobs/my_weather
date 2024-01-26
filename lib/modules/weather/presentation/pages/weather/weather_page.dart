import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../../core/utils/extensions/date_time.dart';
import '../../../../../core/utils/extensions/location_permission.dart';
import '../../controllers/get_location_permission_controller.dart';
import '../../controllers/get_weather_controller.dart';

part 'layouts/_smartphone_layout.dart';
part 'layouts/_tablet_layout.dart';
part 'widgets/_chip.dart';
part 'widgets/_city_and_date.dart';
part 'widgets/_current_weather.dart';
part 'widgets/_location_permission__checker.dart';
part 'widgets/_temperature.dart';
part 'widgets/_weather_extra_info.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final device = context.deviceType;
    return device.fold(
      smartphone: (_) => const _SmartphoneLayout(),
      tablet: (_) => const _TabletLayout(),
      desktop: (_) => const _TabletLayout(),
    );
  }
}
