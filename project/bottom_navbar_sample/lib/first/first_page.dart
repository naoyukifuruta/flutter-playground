import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'first_model.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirstModel>(
      create: (_) => FirstModel(),
      child: Scaffold(
        body: Center(
          child: Consumer<FirstModel>(builder: (context, model, child) {
            return Text('First Page.');
          }),
        ),
      ),
    );
  }
}
