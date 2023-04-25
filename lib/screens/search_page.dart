import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/utilities/constants.dart';

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
                  // Restricting special character and numbers input
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: textFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty && value.length > 3) {
                      return null;
                    } else if (value.length < 4 && value.isNotEmpty) {
                      return 'Minimum character length is 4';
                    } else {
                      return 'Please enter city name';
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
