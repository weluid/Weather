import 'package:flutter/material.dart';

class DailyModel {
  int midTemp;
  DateTime date;

  DailyModel({
    required this.midTemp,
    required this.date,
  });

  static List<DailyModel> fromForecastJson(dynamic json) {
    final weathers = <DailyModel>[];

    final items = [0, 8, 16, 24, 32];
    List<dynamic> responseList = json['list'];
    for (int index in items) {
      if (index >= 0 && index < responseList.length) {
        dynamic item = responseList[index];
        weathers.add(DailyModel(
          midTemp: item['main']['temp'].toInt(),
          date: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
        ));
      }
    }

    debugPrint(weathers.toString());
    return weathers;
  }

  @override
  String toString() {
    return 'DailyModel{midTemp: $midTemp,  date: $date}';
  }
}
