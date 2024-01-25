# My Weather

My Weather is a Flutter application that displays the weather in your current location.

## Requirements

- Flutter 3.16.3 or later

## Getting Started

1. access (Open Weather Api)[https://openweathermap.org/api] and get an API key

2. create a file called `env.json` in the root directory of the project and add the following:

```json
{
  "OPEN_WEATHER_API_KEY": "YOUR_API_KEY"
}
```

**note:** every command to run/build the app should include `--dart-define-from-file=env.dev` to apply the values from the `env.dev.json` file

## Running the app

1. run `flutter pub get` to install dependencies

2. run `flutter run --dart-define-from-file=env.dev` to run the app