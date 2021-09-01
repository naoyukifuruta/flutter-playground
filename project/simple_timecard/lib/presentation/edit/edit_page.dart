import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_timecard/domain/timecard.dart';

import 'edit_model.dart';

class EditPage extends StatelessWidget {
  EditPage({this.timecard});
  TimeCard? timecard;

  @override
  Widget build(BuildContext context) {
    bool isAdd = timecard == null;
    return ChangeNotifierProvider<EditModel>(
      create: (_) => EditModel(timecard),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isAdd ? '追加' : '更新',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Consumer<EditModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('登録日付', style: TextStyle(fontSize: 18)),
                      Spacer(flex: 1),
                      Container(
                        child: model.selectedDate != null
                            ? Text(
                                DateFormat.yMMMEd('ja')
                                    .format(model.selectedDate!),
                                style: TextStyle(fontSize: 18))
                            : Text(''),
                      ),
                      Spacer(flex: 1),
                      isAdd
                          ? ElevatedButton.icon(
                              icon: const Icon(
                                Icons.date_range,
                                color: Colors.black,
                              ),
                              label: const Text(
                                '選択',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                final DateTime? pickedDate =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: new DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime.now()
                                      .add(new Duration(days: 360)),
                                );
                                await model.setDate(pickedDate);
                              },
                            )
                          : SizedBox(width: 80),
                    ],
                  ),
                  SizedBox(height: isAdd ? 0 : 4),
                  Row(
                    children: [
                      Text('出勤時間', style: TextStyle(fontSize: 18)),
                      Spacer(flex: 1),
                      model.selectedStartTime != null
                          ? Text(model.selectedStartTime!,
                              style: TextStyle(fontSize: 18))
                          : Text(''),
                      Spacer(flex: 1),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.black,
                        ),
                        label: const Text(
                          '選択',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          await model.setStartTime(pickedTime);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('退勤時間', style: TextStyle(fontSize: 18)),
                      Spacer(flex: 1),
                      model.selectedEndTime != null
                          ? Text(model.selectedEndTime!,
                              style: TextStyle(fontSize: 18))
                          : Text(''),
                      Spacer(flex: 1),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.black,
                        ),
                        label: const Text(
                          '選択',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          await model.setEndTime(pickedTime);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                if (isAdd) {
                                  await model.add();
                                } else {
                                  await model.update();
                                }
                                Navigator.of(context).pop(true);
                              } catch (e) {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(e.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text(
                              isAdd ? '登録' : '更新',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}