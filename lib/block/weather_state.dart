part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

// Waiting info from server
class WeatherLoading extends WeatherState {}

// Server response error
class WeatherLoadError extends WeatherState {}

// Server  success
class WeatherLoadSuccess extends WeatherState {
  final String text;
  WeatherLoadSuccess({required this.text});
}

// City is not entered
class WeatherCityEmpty extends WeatherState {}
