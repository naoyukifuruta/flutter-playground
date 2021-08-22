import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayModel extends ChangeNotifier {
  Timer? _timer;
  String nowDatetimeString = '';
  String startTimeString = '';
  String endTimeString = '';

  void startTimer() {
    nowDatetimeString =
        DateFormat('yyyy/MM/dd hh:mm:ss').format(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
    notifyListeners();
  }

  void _onTimer(Timer timer) {
    nowDatetimeString =
        DateFormat('yyyy/MM/dd hh:mm:ss').format(DateTime.now());
    notifyListeners();
  }

  Future registerStartTime() async {
    await Future.delayed(Duration(seconds: 1));
    // TODO: ここでDBに登録する
    startTimeString = DateFormat('hh:mm').format(DateTime.now());
    notifyListeners();
  }

  Future registerEndTime() async {
    await Future.delayed(Duration(seconds: 1));
    // TODO: ここでDBに登録する
    endTimeString = DateFormat('hh:mm').format(DateTime.now());
    notifyListeners();
  }
}
