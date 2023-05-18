import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient = WeatherApiClient();

  Future<WeatherModel?> getWeatherFromLocation(
    double latitude,
    double longitude,
  ) async {
    return await weatherApiClient.getLocationWeather(
      latitude,
      longitude,
    );
  }

  Future<WeatherModel?> getWeatherFromLocation1(
    double latitude,
    double longitude,
  ) async {
    return await weatherApiClient.getLocationWeather(
      latitude,
      longitude,
    );
  }
}
