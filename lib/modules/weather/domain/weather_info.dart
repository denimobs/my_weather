import 'weather.dart';
import 'weather_clouds.dart';
import 'weather_coordinates.dart';
import 'weather_main.dart';
import 'weather_sys.dart';
import 'weather_wind.dart';

class WeatherInfo {
  WeatherInfo({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    List<Weather> weatherList = [];
    for (var item in json['weather']) {
      weatherList.add(Weather.fromJson(item));
    }

    return WeatherInfo(
      coord: WeatherCoordinates.fromJson(json['coord']),
      weather: weatherList,
      base: json['base'],
      main: WeatherMain.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WeatherWind.fromJson(json['wind']),
      clouds: WeatherClouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: WeatherSys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  final WeatherCoordinates coord;
  final List<Weather> weather;
  final String base;
  final WeatherMain main;
  final int visibility;
  final WeatherWind wind;
  final WeatherClouds clouds;
  final int dt;
  final WeatherSys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;
}
