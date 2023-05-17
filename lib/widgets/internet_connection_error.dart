import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/components/button.dart';
import 'package:weather/screens/search_page.dart';

import '../utilities/constants.dart';

class InternetError extends StatelessWidget {
  const InternetError({Key? key}) : super(key: key);

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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffefefef),
                  ),
                  child: const Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4,
                    size: 80,
                    color: darkGray,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  AppLocalizations.of(context).noInternet,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: buttonColor,
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppLocalizations.of(context).turnOn,
                    style: const TextStyle(color: darkGray, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 80),
                MyButton(AppLocalizations.of(context).tryAgain, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                }),
                const SizedBox(height: 30),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
