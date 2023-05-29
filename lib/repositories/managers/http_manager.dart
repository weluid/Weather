import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/managers/base_manager.dart';

class HttpManager extends BaseManager {
  @override
  Future<WeatherModel?> getTodayWeatherRequest(String url) async {
    debugPrint('http');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  @override
  Future<List<DailyModel>?> getDailyWeatherRequest(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return DailyModel.fromForecastJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}