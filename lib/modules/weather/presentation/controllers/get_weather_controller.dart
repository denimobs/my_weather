import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/config/logger.dart';
import '../../data/weather_repository.dart';
import '../../domain/weather_info.dart';

part 'get_weather_controller.g.dart';

@riverpod
class GetWeatherController extends _$GetWeatherController {
  @override
  Future<WeatherInfo> build() async {
    try {
      final weatherRepository = ref.read(weatherRepositoryProvider);
      final weather = await weatherRepository.getWeather();

      return weather.fold(
        left: (l) => throw Exception(l),
        right: (r) => r,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
