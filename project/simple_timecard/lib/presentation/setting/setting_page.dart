import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'setting_model.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingModel>(
      create: (_) => SettingModel(),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Consumer<SettingModel>(builder: (context, model, child) {
            return Text('Setting Page.');
          }),
        ),
      ),
    );
  }
}
