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
                  model.datetimeString,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '出勤時刻：',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '09:00',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '退勤時刻：',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '18:00',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            print('click!');
                            // TODO
                          },
                          child: Text('出勤登録')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            print('click!');
                            // TODO
                          },
                          child: Text('退勤登録')),
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
}
