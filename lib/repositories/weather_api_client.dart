import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/magic.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const dailyRequest = "https://api.openweathermap.org/data/2.5/forecast";

class WeatherApiClient {
  Future<WeatherModel?> getWeather({
    String? city,
    double? latitude,
    double? longitude,}) async {
    String url = _getWeatherNowUrl(city, latitude, longitude);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint('Response body: ${response.body}');
      final weatherJson = jsonDecode(response.body);
      return WeatherModel.fromJson(weatherJson);
    } else {
      return null;
    }
  }

  //Location Forecast
  Future<List<DailyModel>?> getDailyWeather({
    String? city,
    double? latitude,
    double? longitude}) async {
    String url = _getDailyWeatherUrl(city, latitude, longitude);

    debugPrint('Request URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final weatherJson = jsonDecode(response.body);
      return DailyModel.fromForecastJson(weatherJson);
    } else {
      return null;
    }
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
