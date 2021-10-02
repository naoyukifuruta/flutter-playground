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
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  final _focusNodeFirst = FocusNode();
  final _focusNodeSecond = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController1 = TextEditingController(text: '');
    _textEditingController2 = TextEditingController(text: '');

    _focusNodeFirst.addListener(() {
      if (_focusNodeFirst.hasFocus) {
        print('From1 フォーカスした');
      } else {
        print('From1 フォーカスが外れた');
      }
    });
    _focusNodeSecond.addListener(() {
      if (_focusNodeSecond.hasFocus) {
        print('From2 フォーカスした');
        _textEditingController2.text = _textEditingController1.text;
      } else {
        print('From2 フォーカスが外れた');
      }
    });
  }

  @override
  void dispose() {
    _focusNodeFirst.dispose();
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(_text1),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(), // 外枠付きデザイン
                    ),
                    controller: _textEditingController1,
                    focusNode: _focusNodeFirst,
                    onChanged: (value) {
                      setState(() {
                        _text1 = value;
                      });
                    },
                  ),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(), // 外枠付きデザイン
                    ),
                    controller: _textEditingController2,
                    focusNode: _focusNodeSecond,
                  ),
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
