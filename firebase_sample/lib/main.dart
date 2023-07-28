import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'add_page.dart';
import 'firebase_options.dart';
import 'user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Firebase Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  void _fetchFirebaseData() async {
    final db = FirebaseFirestore.instance;
    final event = await db.collection("users").get();
    final docs = event.docs;
    final users = docs.map((doc) => User.fromFirestore(doc)).toList();

    setState(() {
      this.users = users;
    });
  }

  @override
  void initState() {
    super.initState();

    _fetchFirebaseData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: users
            .map(
              (user) => ListTile(
                title: Text(user.first),
                subtitle: Text(user.last),
                trailing: Text(user.born.toString()),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext contect) {
                      return AlertDialog(
                        title: const Text("Select Year"),
                        content: Container(
                          height: 300,
                          width: 300,
                          child: YearPicker(
                            firstDate: DateTime(DateTime.now().year - 100, 1),
                            lastDate: DateTime(DateTime.now().year + 100, 1),
                            initialDate: DateTime.now(),
                            selectedDate: DateTime(user.born),
                            onChanged: (DateTime datetime) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user.id)
                                  .update(
                                {'born': datetime.year},
                              );

                              Navigator.pop(context);

                              _fetchFirebaseData();
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
                onLongPress: () async {
                  var dialog = AlertDialog(
                    title: Text('確認'),
                    content: Text('削除します。\nよろしいですか？'),
                    actions: [
                      TextButton(
                        child: const Text('キャンセル'),
                        onPressed: () => Navigator.pop(context, false),
                      ),
                      TextButton(
                        child: const Text(
                          '削除',
                        ),
                        onPressed: () => Navigator.pop(context, true),
                      ),
                    ],
                  );
                  final result = await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return dialog;
                    },
                  );

                  if (!result) return;

                  final db = FirebaseFirestore.instance;
                  await db.collection("users").doc(user.id).delete();
                  _fetchFirebaseData();
                },
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
          _fetchFirebaseData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
