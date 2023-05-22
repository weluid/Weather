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
  final WeatherModel weatherModel;
  final DailyModel dailyModel;

  WeatherLoadSuccess(this.weatherModel, this.dailyModel);
}

// City is not entered
class WeatherCityEmpty extends WeatherState {}

// No access to the location
class CoordinateError extends WeatherState {}

// No internet connection
class ConnectionError extends WeatherState {}
