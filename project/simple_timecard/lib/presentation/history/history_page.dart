import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_timecard/domain/timecard.dart';

import 'history_model.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryModel>(
      create: (_) => HistoryModel()..fetchTimeCards(),
      child: Scaffold(
        body: Center(
          child: Consumer<HistoryModel>(builder: (context, model, child) {
            final List<TimeCard>? timecards = model.timecards;

            if (timecards == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = timecards
                .map(
                  (timecard) => Card(
                    child: ListTile(
                      title: Text(DateFormat('yyyy/MM/dd E ')
                              .format(timecard.targetDate) +
                          timecard.startTimeString +
                          ' ' +
                          timecard.endTimeString),
                      onTap: () {
                        print(timecard.targetDate.toString());
                      },
                    ),
                  ),
                )
                .toList();

            return ListView(
              children: widgets,
            );
          }),
        ),
        floatingActionButton:
            Consumer<HistoryModel>(builder: (context, model, child) {
          return FloatingActionButton(
            onPressed: () async {
              // 画面遷移
              // final bool? isAdded = await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AddBookPage(),
              //     fullscreenDialog: true,
              //   ),
              // );
              // if (isAdded != null && isAdded) {
              //   final snackBar = SnackBar(
              //     backgroundColor: Colors.green,
              //     content: Text('本を追加しました'),
              //   );
              //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // }
              // model.fetchBookList();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
