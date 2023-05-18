class WeatherModel {
  String city;
  int temp;
  String weatherDescriptions;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.weatherDescriptions,
  });

  static WeatherModel fromJson(dynamic json) {
    return WeatherModel(
      city: json['name'],
      temp: json['main']['temp'].toInt(),
      weatherDescriptions: json['weather'][0]['main'],
    );
  }

  @override
  String toString() {
    return 'WeatherModel{city: $city, temp: $temp, weatherDescription: $weatherDescriptions}';
  }
}
