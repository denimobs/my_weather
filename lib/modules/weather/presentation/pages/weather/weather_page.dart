import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../../core/utils/extensions/date_time.dart';
import '../../controllers/get_weather_controller.dart';

part 'widgets/_chip.dart';
part 'widgets/_city_and_date.dart';
part 'widgets/_current_weather.dart';
part 'widgets/_temperature.dart';
part 'widgets/_weather_extra_info.dart';
part 'layouts/_smartphone_layout.dart';
part 'layouts/_tablet_layout.dart';

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
