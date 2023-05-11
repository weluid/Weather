import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utilities/location_manager.dart';

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
    LocationManager location = LocationManager();
    Position? currentPosition = await location.getCurrentLocation();

    if (currentPosition == null) {
      emit(CoordinateError());
    } else {
      WeatherModel? model =
          await WeatherRepository().getWeatherFromLocation(currentPosition.latitude, currentPosition.longitude);
      debugPrint(model.toString());

      if (model == null) {
        emit(WeatherLoadError());
      } else {
        emit(WeatherLoadSuccess(
            WeatherModel(city: model.city, temp: model.temp, weatherDescription: model.weatherDescription)));
      }
    }
  }
}
