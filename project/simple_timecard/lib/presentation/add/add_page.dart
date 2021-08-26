import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'add_model.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '追加',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: Consumer<AddModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('登録日付', style: TextStyle(fontSize: 20)),
                      Spacer(flex: 1),
                      Container(
                        child: model.selectedDate != null
                            ? Text(
                                DateFormat('yyyy/MM/dd E')
                                    .format(model.selectedDate!),
                                style: TextStyle(fontSize: 20))
                            : Text(''),
                      ),
                      Spacer(flex: 1),
                      ElevatedButton.icon(
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
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: new DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate:
                                DateTime.now().add(new Duration(days: 360)),
                          );
                          await model.setDate(pickedDate);
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('出勤時間', style: TextStyle(fontSize: 20)),
                      Spacer(flex: 1),
                      model.selectedStartTime != null
                          ? Text(model.selectedStartTime!,
                              style: TextStyle(fontSize: 20))
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
                      Text('退勤時間', style: TextStyle(fontSize: 20)),
                      Spacer(flex: 1),
                      model.selectedEndTime != null
                          ? Text(model.selectedEndTime!,
                              style: TextStyle(fontSize: 20))
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
                                //await model.addBook();
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
                              '登録',
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
