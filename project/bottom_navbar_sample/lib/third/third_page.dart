import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'third_model.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThirdModel>(
      create: (_) => ThirdModel(),
      child: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Consumer<ThirdModel>(builder: (context, model, child) {
            return Text('Third Page.');
          }),
        ),
      ),
    );
  }
}
