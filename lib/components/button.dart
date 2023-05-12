import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class MyButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  const MyButton(this.buttonTitle, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: backgroundGradient,
        ),
        margin: const EdgeInsets.only(top: 10),
        width: 200,
        height: 50,
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            buttonTitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
