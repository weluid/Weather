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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).weather),
        centerTitle: true,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return _buildParentWidget(context, state);
        },
      ),
    );
  }

  Widget _buildParentWidget(BuildContext context, WeatherState state) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
        backgroundColor: buttonColor,
        child: const Icon(Icons.search),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextWidget(state),
            const SizedBox(
              height: 20,
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

  Widget _buildTextWidget(WeatherState state) {
    if (state is WeatherLoadSuccess) {
      return Column(
        children: [
          Text(state.weatherModel.city),
          Text(state.weatherModel.temp.toString()),
        ],
      );
    } else {
      return const Text("Click the button to get weather");
    }
  }
}
