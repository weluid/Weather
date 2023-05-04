part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent();
}

class CityNameEvent extends WeatherEvent {
  final String city;
  const CityNameEvent({required this.city});
}

class ButtonTappedEvent extends WeatherEvent {}

class SecondButtonTappedEvent extends WeatherEvent {}

class GetWeather extends WeatherEvent {}
