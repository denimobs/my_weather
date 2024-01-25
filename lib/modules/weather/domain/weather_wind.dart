class WeatherWind {
  WeatherWind({
    required this.speed,
    required this.deg,
  });

  factory WeatherWind.fromJson(Map<String, dynamic> json) {
    return WeatherWind(
      speed: json['speed'],
      deg: json['deg'],
    );
  }

  final double speed;
  final int deg;
}
