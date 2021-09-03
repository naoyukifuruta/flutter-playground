import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:provider/provider.dart';
import 'package:simple_timecard/common/navigate_state.dart';
import 'package:simple_timecard/domain/timecard.dart';
import 'package:simple_timecard/presentation/edit/edit_page.dart';

import 'history_model.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryModel>(
      create: (_) => HistoryModel()..fetchTimeCards(),
      child: Scaffold(
        body: Consumer<HistoryModel>(builder: (context, model, child) {
          final List<TimeCard>? timecards = model.timecards;

          if (timecards == null) {
            //return CircularProgressIndicator();
            return Text('date empty.');
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
                      final NavigateState? state = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(timecard: timecard),
                        ),
                      );
                      if (state != null && state == NavigateState.Edit) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('更新しました'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (state != null &&
                          state == NavigateState.Delete) {
                        final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('削除しました'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      model.fetchTimeCards();
                    },
                  ),
                ),
              )
              .toList();

          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('＜',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          onPressed: () {
                            model.setPrevMonth();
                          }),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                                DateFormat.yMMM('ja').format(model.displayDate),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            onPressed: () async {
                              var selectedDate = await showMonthPicker(
                                context: context,
                                initialDate: model.displayDate,
                                firstDate: DateTime(DateTime.now().year - 1),
                                lastDate: DateTime(DateTime.now().year + 1),
                              );
                              if (selectedDate == null) return;
                              model.setDisplayDate(selectedDate);
                            }),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('＞',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          onPressed: () {
                            model.setNextMonth();
                          }),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: widgets,
                  ),
                ),
              ],
            ),
          );
        }),
        floatingActionButton:
            Consumer<HistoryModel>(builder: (context, model, child) {
          return FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () async {
              // 画面遷移
              final NavigateState? state = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(),
                  fullscreenDialog: true,
                ),
              );

              if (state != null && state == NavigateState.Add) {
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
