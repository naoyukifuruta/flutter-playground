import 'package:flutter/material.dart';

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
      home: const DefaultTabController(
        length: 3,
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: const TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined)),
            Tab(icon: Icon(Icons.beach_access_sharp)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ],
        ),
      ),
      body: Listener(
        onPointerMove: (moveEvent) async {
          if (moveEvent.delta.dx > 0) {
            print("swipe right");
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) {
                return AlertDialog(
                  title: const Text("Alert"),
                  content: const Text("スワイプ検知"),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            );
          }

          if (moveEvent.delta.dx < 0) {
            print("swipe left");
          }
        },
        behavior: HitTestBehavior.opaque,
        child: const TabBarView(
          children: <Widget>[
            Center(child: Text('くもり', style: TextStyle(fontSize: 50))),
            Center(child: Text('雨', style: TextStyle(fontSize: 50))),
            Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
          ],
        ),
      ),
    );
  }
}
