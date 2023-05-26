import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient = WeatherApiClient();

  // current weather
  Future<WeatherModel?> getCurrentWeather({
    double? latitude,
    double? longitude,
    String? city}) async {
    return await weatherApiClient.getWeather(
      latitude: latitude,
      longitude: longitude,
      city: city,
    );
  }

  // daily forecast
  Future<List<DailyModel>?> getDailyWeather({
    double? latitude,
    double? longitude,
    String? city,
  }) async {
    return await weatherApiClient.getDailyWeather(
      latitude: latitude,
      longitude: longitude,
      city: city,
    );
  }
}
