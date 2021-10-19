import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MainModel(),

        /// パターン①：ページを分ける場合
        //child: MyHomePage(),
        /// パターン②：わけない場合
        child: Consumer<MainModel>(builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter App'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${model.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        }),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// notifiListenersで呼ばれる
    final model = Provider.of<MainModel>(context);
    //final model = context.watch<MainModel>();
    /// notifiListenersしても呼ばれない(1回しか呼ばれない)
    //final model = context.read<MainModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${model.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
