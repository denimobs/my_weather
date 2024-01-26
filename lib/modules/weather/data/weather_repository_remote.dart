import '../../../core/config/client_http.dart';
import '../../../core/utils/either.dart';
import '../domain/weather_info.dart';
import 'weather_repository.dart';

class WeatherRepositoryRemote implements WeatherRepository {
  WeatherRepositoryRemote(this._client);

  final ClientHttp _client;

  @override
  Future<Either<String, WeatherInfo>> getWeather({
    required (double, double) latLng,
    String units = 'metric',
  }) async {
    try {
      final res = await _client.get(
        url: '/data/2.5/weather',
        queryParameters: {
          'units': 'metric',
          'lat': latLng.$1,
          'lon': latLng.$2,
        },
      );

      return res.fold(
        left: (l) => Left(l.message),
        right: (r) => Right(WeatherInfo.fromJson(r)),
      );
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
