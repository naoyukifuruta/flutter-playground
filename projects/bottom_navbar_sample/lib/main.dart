import 'package:bottom_navbar_sample/top/top_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debugアイコンを非表示に
      home: Scaffold(
        resizeToAvoidBottomInset: false, // キーボードによる画面リサイズを無効
        body: TopPage(),
      ),
    );
  }
}
