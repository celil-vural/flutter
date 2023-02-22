import 'package:weather_app/data/weather_api_client.dart';
import 'package:weather_app/locator.dart';
import 'package:weather_app/models/weather.dart';

class WeatherRepository {
  final weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> fetchWeather(String cityName) async {
    return await weatherApiClient.fetchWeather(cityName);
  }
}
