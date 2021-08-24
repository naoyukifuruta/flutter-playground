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
          title: Text('Add'),
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
                      RawMaterialButton(
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
                        elevation: 4.0,
                        fillColor: Colors.blue,
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
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
                      RawMaterialButton(
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          await model.setStartTime(pickedTime);
                        },
                        elevation: 4.0,
                        fillColor: Colors.blue,
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
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
                      RawMaterialButton(
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          await model.setEndTime(pickedTime);
                        },
                        elevation: 4.0,
                        fillColor: Colors.blue,
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10.0),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 48,
                      width: 96,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            '登録',
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
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
