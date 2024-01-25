class WeatherCoordinates {
  WeatherCoordinates({
    required this.lon,
    required this.lat,
  });

  factory WeatherCoordinates.fromJson(Map<String, dynamic> json) {
    return WeatherCoordinates(
      lon: json['lon'],
      lat: json['lat'],
    );
  }

  final double lon;
  final double lat;
}
