import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  String first = '';
  String last = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'First'),
              onChanged: (text) {
                first = text;
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Last'),
              onChanged: (text) {
                last = text;
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                await _addToFirebase();
                Navigator.pop(context);
              },
              child: const Text('追加する'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addToFirebase() async {
    final db = FirebaseFirestore.instance;

    final user = <String, dynamic>{
      "first": first,
      "last": last,
      "born": 1988,
    };

    await db.collection("users").add(user);
  }
}
