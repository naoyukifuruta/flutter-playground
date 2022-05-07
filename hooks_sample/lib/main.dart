import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final counterProvider = StateNotifierProvider((_) => Counter());

// class Counter extends StateNotifier<int> {
//   Counter() : super(0);
//   void increment() => state++;
// }

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final state = ref.watch(counterProvider);
    var state = useState(0);
    final isWhiteBackGround = useState(true);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: isWhiteBackGround.value ? Colors.white : Colors.black,
        appBar: AppBar(
          title: const Text('Counter App'),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => isWhiteBackGround.value = !isWhiteBackGround.value,
          ),
        ),
        body: Center(
          child: Text(
            state.value.toString(),
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: isWhiteBackGround.value ? Colors.black : Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: () => ref.read(counterProvider.notifier).increment(),
          onPressed: () {
            state.value = state.value + 1;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
