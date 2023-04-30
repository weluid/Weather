import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class MyButton extends StatelessWidget {
  late String _buttonTitle;
  late VoidCallback _onTap;

  MyButton({super.key, required String buttonTitle, required VoidCallback onTap}) {
    _buttonTitle = buttonTitle;
    _onTap = onTap;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
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
            _buttonTitle,
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
