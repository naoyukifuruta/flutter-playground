import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_timecard/domain/timecard.dart';

class EditModel extends ChangeNotifier {
  DateTime? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;

  EditModel(TimeCard? timecard) {
    if (timecard == null) {
      return;
    }
    this.selectedDate = timecard.targetDate;
    this.selectedStartTime = timecard.startTimeString;
    this.selectedEndTime = timecard.endTimeString;
  }

  Future setDate(DateTime? datetime) async {
    this.selectedDate = datetime;
    notifyListeners();
  }

  Future setStartTime(TimeOfDay? time) async {
    if (time == null) {
      return;
    }
    this.selectedStartTime =
        time.hour.toString() + ':' + time.minute.toString();
    notifyListeners();
  }

  Future setEndTime(TimeOfDay? time) async {
    if (time == null) {
      return;
    }
    this.selectedEndTime = time.hour.toString() + ':' + time.minute.toString();
    notifyListeners();
  }
}
