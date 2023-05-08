class WeatherModel {
  String city;
  int temp;
  String weatherDescription;

  WeatherModel({required this.city, required this.temp, required this.weatherDescription});

  static WeatherModel fromJson(dynamic json) {
    return WeatherModel(
        city: json['name'], temp: json['main']['temp'].toInt(), weatherDescription: json['weather'][0]['main']);
  }

  @override
  String toString() {
    return 'WeatherModel{city: $city, temp: $temp, weatherDescription: $weatherDescription}';
  }
}
