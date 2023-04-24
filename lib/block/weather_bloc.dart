import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>(_eventHandler);
    on<ButtonTappedEvent>(_buttonTapped);
    on<SecondButtonTappedEvent>(_secondButtonTapped);
  }
}

Future<void> _eventHandler(WeatherEvent e, Emitter emit) async {
  emit(WeatherInitial());
}

Future<void> _buttonTapped(ButtonTappedEvent e, Emitter emit) async {
  emit(WeatherLoadSuccess(text: "Bye from the Bloc"));
}

Future<void> _secondButtonTapped(SecondButtonTappedEvent e, Emitter emit) async {
  emit(WeatherLoadSuccess(text: "Hello Again!"));
}
