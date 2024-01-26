import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/config/client_http.dart';
import '../../../core/utils/either.dart';
import '../domain/weather_info.dart';
import 'weather_repository_remote.dart';

part 'weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  return WeatherRepositoryRemote(ref.read(clientHttpProvider));
}

abstract interface class WeatherRepository {
  Future<Either<String, WeatherInfo>> getWeather({
    required (double, double) latLng,
    String units = 'metric',
  });
}
