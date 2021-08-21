import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TodayModel extends ChangeNotifier {
  Timer? _timer;
  String datetimeString = '';

  void startTimer() {
    var a = DateTime.now();
    datetimeString = DateFormat('yyyy/MM/dd hh:mm:ss').format(a);
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
    notifyListeners();
  }

  void _onTimer(Timer timer) {
    var a = DateTime.now();
    datetimeString = DateFormat('yyyy/MM/dd hh:mm:ss').format(a);
    notifyListeners();
  }
}
