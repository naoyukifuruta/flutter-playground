import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'today_model.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodayModel>(
      create: (_) => TodayModel()..startTimer(),
      child: Scaffold(
        body: Center(
          child: Consumer<TodayModel>(builder: (context, model, child) {
            return Column(
              children: [
                SizedBox(
                  height: 48,
                ),
                Text(
                  model.nowDatetimeString,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(108.0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        '出勤時刻：',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        model.startTimeString,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(108.0, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        '退勤時刻：',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        model.endTimeString,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 56,
                        width: 120,
                        child: ElevatedButton(
                            onPressed: () async {
                              showProgressDialog(context);
                              await model.registerStartTime();
                              hideProgressDialog(context);
                              showSnackBar(context, '出勤時間を登録しました。');
                            },
                            child:
                                Text('出勤打刻', style: TextStyle(fontSize: 20))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 56,
                        width: 120,
                        child: ElevatedButton(
                            onPressed: () async {
                              showProgressDialog(context);
                              await model.registerEndTime();
                              hideProgressDialog(context);
                              showSnackBar(context, '退勤時間を登録しました。');
                            },
                            child:
                                Text('退勤打刻', style: TextStyle(fontSize: 20))),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void showProgressDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 300),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void hideProgressDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
