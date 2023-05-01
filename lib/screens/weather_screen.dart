import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/block/weather_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/screens/search_page.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/widgets/loading_state.dart';
import 'package:weather/widgets/error_page.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
            const Text("Hello"),
            const SizedBox(
              height: 20,
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
}
