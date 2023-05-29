import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/managers/base_manager.dart';

class DioManager extends BaseManager {

  @override
  Future<WeatherModel?> getTodayWeatherRequest(String url) async {
    debugPrint('dio');
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  @override
  Future<List<DailyModel>?> getDailyWeatherRequest(String url) async {
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      return DailyModel.fromForecastJson(response.data);
    } else {
      return null;
    }
  }
}