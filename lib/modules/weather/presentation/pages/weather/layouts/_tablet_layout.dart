part of '../weather_page.dart';

class _TabletLayout extends StatelessWidget {
  const _TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Weather'),
      ),
      body: const _LocationPermissionChecker(
        child: _TabletContent(),
      ),
    );
  }
}

class _TabletContent extends ConsumerWidget {
  const _TabletContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(getWeatherControllerProvider);

    return weather.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Text(error.toString()),
      ),
      data: (weather) {
        return Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 6,
              child: Container(
                padding: const EdgeInsets.all(16),
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    _CityAndDate(
                      city: weather.name,
                    ),
                    const SizedBox(height: 16),
                    _Temperature(
                      temp: weather.main.temp,
                      tempMin: weather.main.tempMin,
                      tempMax: weather.main.tempMax,
                    ),
                    const Divider(endIndent: 30, indent: 30),
                    _CurrentWeather(
                      currentWeather: weather.weather.first.description,
                    ),
                    const SizedBox(height: 16),
                    _WeatherExtraInfo(
                      feelsLike: weather.main.feelsLike,
                      clouds: weather.clouds.all,
                      pressure: weather.main.pressure,
                      humidity: weather.main.humidity,
                      windSpeed: weather.wind.speed,
                      visibility: weather.visibility,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
