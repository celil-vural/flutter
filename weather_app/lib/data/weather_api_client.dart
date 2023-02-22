import 'package:http/http.dart';
import 'package:weather_app/models/weather.dart';

class WeatherApiClient {
  static const String baseUrl = 'https://api.collectapi.com/weather/getWeather';
  final Client httpClient = Client();
  Future<Weather> fetchWeather(String cityName) async {
    final url = '$baseUrl?data.lang=tr&data.city=$cityName';
    final response = await httpClient.get(Uri.parse(url), headers: {
      'content-type': 'application',
      'authorization': 'apikey 41BStz4Pcgw6aRd5BTsUse:7jx6nvW6D3FITLUNyksZbh'
    });
    if (response.statusCode != 200) {
      throw Exception('error getting weather for city $cityName');
    } else {
      final weather = weatherFromJson(response.body);
      return weather;
    }
  }
}
