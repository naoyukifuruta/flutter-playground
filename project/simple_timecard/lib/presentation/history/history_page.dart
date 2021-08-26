import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_timecard/domain/timecard.dart';
import 'package:simple_timecard/presentation/edit/edit_page.dart';

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
                      title: Row(
                        children: [
                          Text(
                            DateFormat.yMMMEd('ja').format(timecard.targetDate),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            timecard.startTimeString,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            timecard.endTimeString,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        final bool? isEdited = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPage(timecard: timecard),
                          ),
                        );
                        if (isEdited != null && isEdited) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('更新しました'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        model.fetchTimeCards();
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
            backgroundColor: Colors.white,
            onPressed: () async {
              // 画面遷移
              final bool? isAdded = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(),
                  fullscreenDialog: true,
                ),
              );

              if (isAdded != null && isAdded) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('追加しました'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }

              model.fetchTimeCards();
            },
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          );
        }),
      ),
    );
  }
}
