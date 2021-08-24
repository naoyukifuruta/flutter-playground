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
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
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
                        child: Text('日付選択')),
                    SizedBox(width: 16),
                    model.selectedDate != null
                        ? Text(DateFormat('yyyy/MM/dd E')
                            .format(model.selectedDate!))
                        : Text('未選択'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          await model.setStartTime(pickedTime);
                        },
                        child: Text('日付選択')),
                    SizedBox(width: 16),
                    model.selectedStartTime != null
                        ? Text(model.selectedStartTime!)
                        : Text('未選択'),
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
