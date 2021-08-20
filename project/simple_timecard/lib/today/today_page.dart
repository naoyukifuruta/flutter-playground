import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'today_model.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodayModel>(
      create: (_) => TodayModel(),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Consumer<TodayModel>(builder: (context, model, child) {
            return Text('Today Page.');
          }),
        ),
      ),
    );
  }
}
