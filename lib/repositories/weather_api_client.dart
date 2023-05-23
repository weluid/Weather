import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/magic.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const dailyRequest = "https://api.openweathermap.org/data/2.5/forecast";

class WeatherApiClient {
  //City Weather
  Future<WeatherModel?> getCityWeather(String cityName) async {
    String url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint('Response body: ${response.body}');

      final weatherJson = jsonDecode(response.body);
      return WeatherModel.fromJson(weatherJson);
    } else {
      return null;
    }
  }

  //Location Weather
  Future<WeatherModel?> getLocationWeather(double latitude, double longitude) async {
    String url = '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    debugPrint('Request URL: $url');
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
  Future<List<DailyModel>?> getDailyLocationWeather(
      double latitude,
      double longitude) async {
    String url =
        '$dailyRequest?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&lang=uk';

    debugPrint('Request URL: $url');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final weatherJson = jsonDecode(response.body);
      return DailyModel.fromForecastJson(weatherJson);
    } else {
      return null;
    }
  }

  //City Forecast
  Future<List<DailyModel>?> getDailyCityWeather(String cityName) async {
    String url =
        '$dailyRequest?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint('Response body: ${response.body}');

      final weatherJson = jsonDecode(response.body);
      return DailyModel.fromForecastJson(weatherJson);
    } else {
      return null;
    }
  }
}
