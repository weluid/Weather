import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, // remove back button
        elevation: 0,
        backgroundColor: const Color(0xFFf4f4fc),
        centerTitle: true,
        title: const Text("Search for city"),
        titleTextStyle: const TextStyle(
          color: mainDarkColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(color: mainDarkColor),
      ),
      backgroundColor: const Color(0xFFf4f4fc),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: textFieldInputDecoration,
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            GestureDetector(
              onTap: () {
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
