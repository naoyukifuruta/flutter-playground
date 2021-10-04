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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _text1 = '';
  String _text2 = '';
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController1 = TextEditingController(text: '');
    _textEditingController2 = TextEditingController(text: '');

    _focusNode1.addListener(() {
      if (_focusNode1.hasFocus) {
        print('From1 Forcus on');
      } else {
        print('From1 Forcus out');
        setState(() {
          _text1 = _textEditingController1.text;
        });
      }
    });
    _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        print('From2 Forcus on');
      } else {
        print('From1 Forcus out');
        setState(() {
          _text2 = _textEditingController2.text;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _textEditingController1,
                    focusNode: _focusNode1,
                  ),
                  const SizedBox(height: 8.0),
                  Text(_text1),
                  const SizedBox(height: 32.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _textEditingController2,
                    focusNode: _focusNode2,
                  ),
                  const SizedBox(height: 8.0),
                  Text(_text2),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
