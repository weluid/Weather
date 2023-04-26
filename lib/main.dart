import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'block/weather_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'screens/search_page.dart';
import 'utilities/constants.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Lato'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('en'), // English
        Locale('uk'), // Ukrainian
      ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (BuildContext context) {
        return WeatherBloc();
      },
      child: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).weather),
        centerTitle: true,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return _buildParentWidget(context, state);
        },
        listener: (context, state) {},
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
          print('City after: $city'); //test city
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
                context.read<WeatherBloc>().add(ButtonTappedEvent());
              },
              child: const Text('Click me'),
            ),
            TextButton(
              onPressed: () {
                context.read<WeatherBloc>().add(SecondButtonTappedEvent());
              },
              child: const Text('Click me again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextWidget(WeatherState state) {
    if (state is WeatherLoadSuccess) {
      return Text(state.text);
    } else {
      return const Text("Hello");
    }
  }
}
