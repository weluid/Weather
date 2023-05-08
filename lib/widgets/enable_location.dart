import 'package:flutter/material.dart';
import 'package:weather/components/button.dart';
import 'package:weather/screens/search_page.dart';

import '../utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffefefef)),
            child: const Icon(
              Icons.location_on,
              size: 80,
              color: darkGray,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Enable\n Location',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: buttonColor),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              textAlign: TextAlign.center,
              "Please enable your location for using your app smoothly or go to the search for city",
              style: TextStyle(color: darkGray, fontSize: 18),
            ),
          ),
          const SizedBox(height: 80),
          MyButton(
              buttonTitle: 'Turn on location',
              onTap: () async {
                await Geolocator.openAppSettings();
              }),
          const SizedBox(height: 30),
          GestureDetector(
            child: const Text('Search for city'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
