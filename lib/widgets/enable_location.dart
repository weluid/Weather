import 'package:flutter/material.dart';
import 'package:weather/components/button.dart';
import 'package:weather/screens/search_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
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
                 Text(
                  AppLocalizations.of(context).enableLocation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: buttonColor),
                ),
                const SizedBox(height: 40),
                 Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context).enableLocationDescription,
                    style: const TextStyle(color: darkGray, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 80),
                MyButton(

                    buttonTitle: AppLocalizations.of(context).onLocation,
                    onTap: () async {
                      await Geolocator.openAppSettings();
                    }),
                const SizedBox(height: 30),
                GestureDetector(
                  child:  Text(AppLocalizations.of(context).searchCity),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchPage()),
                    );
                  },
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
