import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_model.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditModel>(
      create: (_) => EditModel(),
      child: Scaffold(
        body: Center(
          child: Consumer<EditModel>(builder: (context, model, child) {
            return Text('Setting Page.');
          }),
        ),
      ),
    );
  }
}
