import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'history_model.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryModel>(
      create: (_) => HistoryModel(),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Consumer<HistoryModel>(builder: (context, model, child) {
            return Text('History Page.');
          }),
        ),
      ),
    );
  }
}
