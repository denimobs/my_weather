part of '../weather_page.dart';

class _Temperature extends StatelessWidget {
  const _Temperature({
    super.key,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  final double temp;
  final double tempMin;
  final double tempMax;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${temp.round()}°C',
          style: context.textTheme.titleMedium?.copyWith(
            fontSize: 48,
          ),
        ),
        Text(
          '${tempMin.round()}°C / ${tempMax.round()}°C',
        ),
      ],
    );
  }
}
