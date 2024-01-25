part of '../weather_page.dart';

class _CurrentWeather extends StatelessWidget {
  const _CurrentWeather({
    super.key,
    required this.currentWeather,
  });

  final String currentWeather;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentWeather,
      style: context.textTheme.titleMedium?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
