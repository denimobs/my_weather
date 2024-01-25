part of '../weather_page.dart';

class _WeatherExtraInfo extends ConsumerWidget {
  const _WeatherExtraInfo({
    required this.feelsLike,
    required this.clouds,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
  });

  final double feelsLike;
  final int clouds;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int visibility;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _Chip(
          icon: const Icon(Icons.thermostat_outlined),
          label: '${feelsLike.round()}°C',
        ),
        _Chip(
          icon: const Icon(Icons.cloud_outlined),
          label: '$clouds%',
        ),
        _Chip(
          icon: const Icon(Icons.waves_outlined),
          label: '$pressure hPa',
        ),
        _Chip(
          icon: const Icon(Icons.air),
          label: '$windSpeed m/s',
        ),
        _Chip(
          icon: const Icon(Icons.water_drop_outlined),
          label: '$humidity%',
        ),
        _Chip(
          icon: const Icon(Icons.foggy),
          label: '$visibility m',
        ),
      ],
    );
  }
}
