import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

const apiKey = '717b69e1c978a60c566d8b68c9133d53';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherApiClient {
  //City Weather
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final weatherJson = jsonDecode(response.body);
      return WeatherModel.fromJson(weatherJson);
    } else {
      throw Exception('Error getting data for city');
    }
  }
}
