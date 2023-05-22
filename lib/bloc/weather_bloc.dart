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
    final connectivityResult = await (Connectivity().checkConnectivity());
    debugPrint('connectivityResult ->$connectivityResult');

    if (connectivityResult == ConnectivityResult.none) {
      emit(ConnectionError());
      return;
    }
    LocationManager location = LocationManager();
    Position? currentPosition = await location.getCurrentLocation();

    if (currentPosition == null) {
      emit(CoordinateError());
    } else {
      WeatherModel? model = await WeatherRepository().getWeatherFromLocation(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      debugPrint(model.toString());

      List<DailyModel>? dailyModel =
      await WeatherRepository().getDailyWeatherFromLocation(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      debugPrint(dailyModel.toString());

      if (model == null) {
        emit(WeatherLoadError());
      } else {
        emit(
          WeatherLoadSuccess(
            WeatherModel(
              city: model.city,
              temp: model.temp,
              weatherDescription: model.weatherDescription,
            ),
            DailyModel(midTemp: dailyModel![0].midTemp, date: dailyModel[0].date),
          ),
        );
      }
    }
  }

  Future<void> _eventWeatherFromCity(CityNameEvent e, Emitter emit) async {
    emit(WeatherLoading());

    WeatherModel? model = await WeatherRepository().getWeatherFromCity(e.city);
    debugPrint(model.toString());

    if (model == null) {
      emit(WeatherLoadError());
    } else {
      emit(
        WeatherLoadSuccess(
          WeatherModel(
            city: model.city,
            temp: model.temp,
            weatherDescription: model.weatherDescription,
          ),
          DailyModel(midTemp: 11, date: DateTime.fromMillisecondsSinceEpoch(1684789200 * 1000)),
        ),
      );
    }
  }
}
