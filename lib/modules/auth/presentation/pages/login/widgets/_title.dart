part of '../login_page.dart';

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.wb_sunny, size: 62),
        Text(
          'Weather App',
          style: context.textTheme.titleLarge,
        ),
      ],
    );
  }
}
