import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/block/weather_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/screens/search_page.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/widgets/loading_state.dart';
import 'package:weather/widgets/error_page.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String data;
  late String city;
  late String temp;
  late String weatherDescription;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return _buildParentWidget(context, state);
      },
    );
  }

  Widget _buildParentWidget(BuildContext context, WeatherState state) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: backgroundGradient),
        child: Column(
          children: [
            const SizedBox(height: 68),
            searchButton(context),
            Text(
              data = "Today, May 7th, 2021",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              city = state is WeatherLoadSuccess ? city = state.weatherModel.city : "--",
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  temp = state is WeatherLoadSuccess ? temp = state.weatherModel.temp.toString() : "--",
                  style: const TextStyle(color: Colors.white, fontSize: 120),
                ),
                const SizedBox(width: 8),
                const Baseline(
                  baseline: 0,
                  baselineType: TextBaseline.ideographic,
                  child: Text(
                    '°',
                    style: TextStyle(color: Colors.white, fontSize: 60),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 40),
              child: Text(
                weatherDescription = state is WeatherLoadSuccess
                    ? weatherDescription = state.weatherModel.weatherDescription.toString()
                    : "--",
                style: const TextStyle(fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<WeatherBloc>().add(GetWeather());
              },
              child: const Text('Get weather model'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ErrorPage(),
                  ),
                );
              },
              child: const Text('Error State'),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector searchButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final city = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ),
        );
        if (city != null) {
          BlocProvider.of<WeatherBloc>(context).add(
            CityNameEvent(city: city),
          );
        }
        debugPrint('City after: $city'); //test city
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 44),
        child: Align(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
