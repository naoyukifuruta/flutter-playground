import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final forcus1 = FocusNode();
  final forcus2 = FocusNode();
  final forcus3 = FocusNode();
  final forcus4 = FocusNode();
  final forcus5 = FocusNode();

  @override
  Widget build(BuildContext context) {
    forcus1.addListener(() {
      if (!forcus1.hasPrimaryFocus) {
        print('forcus1 out');
      }
    });
    forcus2.addListener(() {
      if (!forcus2.hasPrimaryFocus) {
        print('forcus2 out');
      }
    });
    forcus3.addListener(() {
      if (!forcus3.hasPrimaryFocus) {
        print('forcus3 out');
      }
    });
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('home'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
                child: Column(
              children: [
                TextFormField(
                  //initialValue: model.patientModel.patient_name,
                  focusNode: forcus1,
                  keyboardType: TextInputType.text,
                  maxLength: 15,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).focusColor,
                  ),
                  onSaved: (value) {
                    print('on saved');
                  },
                  onFieldSubmitted: (value) {
                    print('on submit');
                  },
                  validator: (value) {},
                ),
                TextFormField(
                  //initialValue: model.patientModel.patient_name,
                  focusNode: forcus2,
                  keyboardType: TextInputType.text,
                  maxLength: 16,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).focusColor,
                  ),
                  onSaved: (value) {
                    print('on saved');
                  },
                  onFieldSubmitted: (value) {
                    print('on submit');
                  },
                ),
                TextFormField(
                  //initialValue: model.patientModel.patient_name,
                  focusNode: forcus3,
                  keyboardType: TextInputType.text,
                  maxLength: 16,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).focusColor,
                  ),
                  onSaved: (value) {
                    print('on saved');
                  },
                  onFieldSubmitted: (value) {
                    print('on submit');
                  },
                ),
              ],
            ));
          }),
        ),
      ),
    );
  }
}
