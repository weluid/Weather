import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';

abstract class BaseManager {
  Future<WeatherModel?> getTodayWeatherRequest(String url);

  Future<List<DailyModel>?> getDailyWeatherRequest(String url);
}