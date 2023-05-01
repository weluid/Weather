import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>(_eventHandler);
    on<GetWeather>(_eventWeather);
  }

  Future<void> _eventHandler(WeatherEvent e, Emitter emit) async {
    emit(WeatherInitial());
  }

  Future<void> _eventWeather(WeatherEvent e, Emitter emit) async {
    emit(WeatherLoadSuccess(WeatherModel("Kropyvnytskyi", Random().nextInt(50), "Cloudy")));
  }
}
