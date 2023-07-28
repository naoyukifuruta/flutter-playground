import 'package:flutter/material.dart';
import 'package:provider_sample/count_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountPage(),
    );
  }
}

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountModel>(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('カウンターアプリ'),
        ),
        body: Center(
          child: Consumer<CountModel>(
            builder: (context, model, child) {
              final count = model.count;
              return Text(
                '$count',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
        floatingActionButton: Consumer<CountModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: model.incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
