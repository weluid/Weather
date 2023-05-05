import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({required this.weatherApiClient});

  Future<WeatherModel> getWeather(String city) async {
    return await weatherApiClient.getCityWeather(city);
  }
}
