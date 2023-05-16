import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/screens/search_page.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/widgets/enable_location.dart';
import 'package:weather/widgets/error_page.dart';
import 'package:weather/widgets/internet_connection_error.dart';
import 'package:weather/widgets/loading_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (BuildContext context) {
        WeatherBloc bloc = WeatherBloc();
        bloc.add(GetWeather());
        return bloc;
      },
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return _buildParentWidget(context, state);
          } else if (state is WeatherLoadError) {
            return const ErrorPage();
          } else if (state is CoordinateError) {
            return const EnableLocation();
          } else if (state is ConnectionError) {
            return const InternetError();
          } else {
            return const LoadingWeather();
          }
        },
      ),
    );
  }

  Widget _buildParentWidget(BuildContext context, WeatherLoadSuccess state) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: backgroundGradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 72),
              searchButton(context),
              const SizedBox(height: 5),
              Text(
                AppLocalizations.of(context).date(DateTime.now()),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                state.weatherModel.city,
                style: const TextStyle(color: Colors.white, fontSize: 28),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.weatherModel.temp.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 120),
                    ),
                    const Baseline(
                      baseline: 40,
                      baselineType: TextBaseline.ideographic,
                      child: Text(
                        '°',
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w100),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                state.weatherModel.weatherDescription.toString(),
                style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
          if (!mounted) return;
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
