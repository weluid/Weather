import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/magic.dart';
import 'package:weather/repositories/managers/enum_managers.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const dailyRequest = "https://api.openweathermap.org/data/2.5/forecast";

class WeatherApiClient {
  final Managers baseManager = Managers.httpManager;

  Future<WeatherModel?> getWeather({
    String? city,
    double? latitude,
    double? longitude,
  }) async {
    final response = await baseManager
        .getCurrentManager()
        .getTodayWeatherRequest(_getWeatherNowUrl(
      city,
      latitude,
      longitude,
    ));

    return response;
  }

  //Location Forecast
  Future<List<DailyModel>?> getDailyWeather({
    String? city,
    double? latitude,
    double? longitude}) async {

    String url = _getDailyWeatherUrl(city, latitude, longitude);

    final response =
    await baseManager.getCurrentManager().getDailyWeatherRequest(url);

    return response;
  }

  String _getWeatherNowUrl(
    String? city,
    double? latitude,
    double? longitude,
  ) {
    return city != null
        ? '$openWeatherMapURL?q=$city&appid=$apiKey&units=metric'
        : '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';
  }

  String _getDailyWeatherUrl(
    String? city,
    double? latitude,
    double? longitude,
  ) {
    return city != null
        ? '$dailyRequest?q=$city&appid=$apiKey&units=metric'
        : '$dailyRequest?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=uk';
  }
}
