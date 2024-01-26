import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/config/logger.dart';
import '../../data/weather_repository.dart';
import '../../domain/weather_info.dart';
import 'get_my_location_controller.dart';

part 'get_weather_controller.g.dart';

@riverpod
class GetWeatherController extends _$GetWeatherController {
  @override
  AsyncValue<WeatherInfo> build() {
    final location = ref.watch(getMyLocationControllerProvider);
    return location.when(
      loading: () => const AsyncLoading(),
      error: (error, stack) => AsyncError(error, stack),
      data: (position) {
        _getWeather(position);
        return const AsyncLoading();
      },
    );
  }

  Future<void> _getWeather(Position position) async {
    state = const AsyncLoading();
    try {
      final weatherRepository = ref.read(weatherRepositoryProvider);
      final weather = await weatherRepository.getWeather(
        latLng: (position.latitude, position.longitude),
      );

      state = weather.fold(
        left: (l) => AsyncError(l, StackTrace.current),
        right: (r) => AsyncData(r),
      );
    } catch (e, stack) {
      logger.e('Failed to get weather', error: e, stackTrace: stack);
      state = AsyncError(e, StackTrace.current);
    }
  }
}
