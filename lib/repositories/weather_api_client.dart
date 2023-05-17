import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';
import 'package:weather/magic.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

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
  Future<WeatherModel?> getLocationWeather(
      double latitude, double longitude) async {
    String url =
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

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
}
