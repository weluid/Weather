import 'package:flutter/material.dart';

class ForecastTile extends StatelessWidget {
  final String temp;
  final String date;
  final String? icon;

  const ForecastTile({super.key, required this.temp, required this.date, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Column(
          children: [
            Text(
              date,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Image.network(
              'https://openweathermap.org/img/wn/$icon@2x.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10),
            Text(
              '$temp°',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
