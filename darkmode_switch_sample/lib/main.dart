import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme.dart';
import 'main_model.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var isDarkPrefValue = prefs.getBool('isDark') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(isDarkPrefValue),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return MaterialApp(
      theme: theme.buildTheme(),
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      child: Consumer<MainModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('ダークモード切り替えサンプル'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(64.0),
                child: ListTile(
                  title: const Text("ダークモード"),
                  trailing: Switch.adaptive(
                    value: theme.isDark,
                    onChanged: (_) {
                      theme.changeMode();
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
