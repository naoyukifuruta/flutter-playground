import 'package:flutter/material.dart';

class AddModel extends ChangeNotifier {
  DateTime? selectedDate;
  String? selectedStartTime;
  String? selectedEndTime;

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
