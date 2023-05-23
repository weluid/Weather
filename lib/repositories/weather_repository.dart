import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient = WeatherApiClient();

  // current weather
  Future<WeatherModel?> getWeatherFromLocation(
    double latitude,
    double longitude,
  ) async {
    return await weatherApiClient.getLocationWeather(
      latitude,
      longitude,
    );
  }

  // current city
  Future<WeatherModel?> getWeatherFromCity(String city) async {
    return await weatherApiClient.getCityWeather(city);
  }

  // daily forecast
  Future<List<DailyModel>?> getDailyWeatherFromLocation(
    double latitude,
    double longitude,
  ) async {
    return await weatherApiClient.getDailyLocationWeather(
      latitude,
      longitude,
    );
  }

  // daily city forecast
  Future<List<DailyModel>?> getDailyWeatherFromCity(String city) async {
    return await weatherApiClient.getDailyCityWeather(city);
  }
}
