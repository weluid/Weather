import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final VoidCallback onTap;

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
        width: MediaQuery.of(context).size.width * 0.35,
        // 35% FROM SCREEN
        height: 50,
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
