import 'package:flutter/material.dart';
import 'package:simple_timecard/domain/timecard.dart';

class HistoryModel extends ChangeNotifier {
  List<TimeCard>? timecards;

  void fetchTimeCards() async {
    List<TimeCard> testData = [
      new TimeCard(DateTime(2021, 8, 19), '09:31', '18:37'),
      new TimeCard(DateTime(2021, 8, 20), '09:32', '18:38'),
      new TimeCard(DateTime(2021, 8, 23), '09:45', '18:40')
    ];
    this.timecards = testData;
    notifyListeners();
  }
}
