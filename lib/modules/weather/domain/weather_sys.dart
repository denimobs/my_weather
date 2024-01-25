class WeatherSys {
  WeatherSys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherSys.fromJson(Map<String, dynamic> json) {
    return WeatherSys(
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  final String country;
  final int sunrise;
  final int sunset;
}
