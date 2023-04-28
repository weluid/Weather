import 'package:flutter/material.dart';
import 'package:weather/components/button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/errorPicture.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 18),
              child: Text(
                AppLocalizations.of(context).error,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context).somethingWrong,
              style: const TextStyle(color: Color(0xff9D9D9D), fontSize: 18),
            ),
            const SizedBox(height: 32),
            MyButton(
                buttonTitle: AppLocalizations.of(context).tryAgain,
                onTap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
