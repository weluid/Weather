import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/components/button.dart';

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
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffefefef)),
                  child: const Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4,
                    size: 80,
                    color: darkGray,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Oops, No Internet Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: buttonColor),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Make sure Wi-Fi or cellular data is turned on and then try again.',
                    style: TextStyle(color: darkGray, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 80),
                MyButton(AppLocalizations.of(context).tryAgain, () async {
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
