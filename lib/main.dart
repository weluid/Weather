import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'block/weather_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'), // English
        Locale('uk'), // Ukrainian
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
    return Center(
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
