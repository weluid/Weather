import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/validator/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String _cityName;
  final Color _backgroundColor = const Color(0xFFf4f4fc);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // remove drop shadow
        elevation: 0,
        backgroundColor: _backgroundColor,
        centerTitle: true,
        title: const Text("Search for city"),
        titleTextStyle: const TextStyle(
          color: mainDarkColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: mainDarkColor),
      ),
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: textFieldInputDecoration,
                  onChanged: (value) {
                    _cityName = value;
                  },
                  validator: (value) {
                    WeatherValidateCode code = Validator.cityValidator(value ?? "");
                    switch (code) {
                      case WeatherValidateCode.validCityName:
                        return null;
                      case WeatherValidateCode.emptyCityName:
                        return AppLocalizations.of(context).emptyCityName;
                      case WeatherValidateCode.invalidCityName:
                        return AppLocalizations.of(context).invalidCityName;
                    }
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                Navigator.pop(context, _cityName);
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: buttonColor,
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getWeather,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
