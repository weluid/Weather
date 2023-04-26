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
  late String cityName;
  Color backgroundColor = const Color(0xFFf4f4fc);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // remove drop shadow
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text("Search for city"),
        titleTextStyle: const TextStyle(
          color: mainDarkColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: mainDarkColor),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  // // Restricting special character and numbers input
                  // inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: textFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                  validator: (value) {
                    WeatherValidateCode code = Validator.cityValidator(value ?? "");
                    switch (code) {
                      case WeatherValidateCode.validCityName:
                        return null;
                      case WeatherValidateCode.emptyCityName:
                        return AppLocalizations.of(context).emptyCityName;
                      case WeatherValidateCode.notEnoughSymbol:
                        return AppLocalizations.of(context).notEnoughSymbol;
                      case WeatherValidateCode.invalidCityName:
                        return AppLocalizations.of(context).invalidCityName;
                    }
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // print(cityName);
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                Navigator.pop(context, cityName);
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: buttonColor,
                ),
                child: const Center(
                  child: Text(
                    'Get Weather',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
