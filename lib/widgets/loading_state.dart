import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/utilities/constants.dart';

class LoadingWeather extends StatefulWidget {
  const LoadingWeather({Key? key}) : super(key: key);

  @override
  State<LoadingWeather> createState() => _LoadingWeatherState();
}

class _LoadingWeatherState extends State<LoadingWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient,
      child: const Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
