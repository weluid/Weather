import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/magic.dart';
import 'package:dio/dio.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const dailyRequest = "https://api.openweathermap.org/data/2.5/forecast";

//TODO If u want to change request way, pls change this constant ↓
//TODO 'httpClient = 'dio' - for DIO lib
//TODO 'httpClient = 'http' (or any String value) - for HTTP lib
const String httpClient = 'http';
late dynamic weatherJson;

class WeatherApiClient {
  Future<WeatherModel?> getWeather({
    String? city,
    double? latitude,
    double? longitude,
  }) async {
    String url = _getWeatherNowUrl(city, latitude, longitude);
    final response = await _getResponse(httpClient: httpClient, url: url);

    if (response.statusCode == 200) {
      httpClient == 'dio' ? weatherJson =
          response.data :
      weatherJson = jsonDecode(response.body);
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
    final response = await _getResponse(httpClient: httpClient, url: url);

    if (response.statusCode == 200) {
      httpClient == 'dio' ? weatherJson =
          response.data : weatherJson =
          jsonDecode(response.body);
      return DailyModel.fromForecastJson(weatherJson);
    } else {
      return null;
    }
  }

  // Identify request method and return response
  Future<dynamic> _getResponse({
    required String httpClient,
    required String url}) async {
    if (httpClient == 'dio') {
      return await Dio().get(url);
    } else {
      return await http.get(Uri.parse(url));
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
