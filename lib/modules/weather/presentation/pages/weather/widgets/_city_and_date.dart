part of '../weather_page.dart';

class _CityAndDate extends StatelessWidget {
  const _CityAndDate({
    required this.city,
  });

  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          style: context.textTheme.titleLarge?.copyWith(
            fontSize: 28,
          ),
        ),
        Text(DateTime.now().MMMEd),
      ],
    );
  }
}
