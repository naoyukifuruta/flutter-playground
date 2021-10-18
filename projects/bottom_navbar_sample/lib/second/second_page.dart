import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'second_model.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SecondModel>(
      create: (_) => SecondModel(),
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Center(
          child: Consumer<SecondModel>(builder: (context, model, child) {
            return Text('Second Page.');
          }),
        ),
      ),
    );
  }
}
