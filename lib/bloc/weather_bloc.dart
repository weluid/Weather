import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/models/daily_weather_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_repository.dart';
import 'package:weather/utilities/location_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>(_eventHandler);
    on<GetWeather>(_eventWeather);
    on<CityNameEvent>(_eventWeatherFromCity);
  }

  Future<void> _eventHandler(WeatherEvent e, Emitter emit) async {
    emit(WeatherInitial());
  }

  Future<void> _eventWeather(WeatherEvent e, Emitter emit) async {
    if (await _checkInternetStatus() == false) {
      emit(ConnectionError());
      return;
    }
    LocationManager location = LocationManager();
    Position? currentPosition = await location.getCurrentLocation();

    if (currentPosition == null) {
      emit(CoordinateError());
    } else {
      // current weather
      WeatherModel? model = await WeatherRepository().getCurrentWeather(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      );
      debugPrint(model.toString());

      // daily forecast
      List<DailyModel>? dailyModel = await WeatherRepository().getDailyWeather(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude,
      );
      debugPrint(dailyModel.toString());

      _implementState(model, dailyModel, emit);
    }
  }

  Future<void> _eventWeatherFromCity(CityNameEvent e, Emitter emit) async {
    // emit(WeatherLoading());
    if (await _checkInternetStatus() == false) {
      emit(ConnectionError());
      return;
    }
    // current weather
    WeatherModel? model = await WeatherRepository().getCurrentWeather(city: e.city);
    debugPrint(model.toString());

    // daily forecast
    List<DailyModel>? dailyModel = await WeatherRepository().getDailyWeather(city: e.city);
    debugPrint(dailyModel.toString());

    _implementState(model, dailyModel, emit);
  }

  _implementState(WeatherModel? model, List<DailyModel>? dailyModel, Emitter emit) {
    if (model == null || dailyModel == null) {
      emit(WeatherLoadError());
    } else {
      emit(
        WeatherLoadSuccess(
          WeatherModel(
            city: model.city,
            temp: model.temp,
            weatherDescription: model.weatherDescription,
          ),
          dailyModel,
        ),
      );
    }
  }

  Future<bool> _checkInternetStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    return connectivityResult == ConnectivityResult.none ? false : true;
  }
}
