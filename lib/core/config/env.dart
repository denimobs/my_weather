abstract class Env {
  static const weatherApiKey = String.fromEnvironment('WEATHER_API_KEY');

  static List<String> verifyFileIntegrity() {
    final missingKeys = <String>[];

    const weatherApiKey = String.fromEnvironment('WEATHER_API_KEY');
    if (weatherApiKey.isEmpty) {
      missingKeys.add('WEATHER_API_KEY');
    }

    return missingKeys;
  }
}
