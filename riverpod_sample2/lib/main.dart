import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample2/random_color.dart';

import 'counter.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('riverpod sample'),
      ),
      body: const Center(
        child: _CounterText(),
      ),
      floatingActionButton: const _ActionButtons(),
    );
  }
}

class _CounterText extends ConsumerWidget {
  const _CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final color = ref.watch(randomColorProvider);
    return Text(
      '$counter',
      style: TextStyle(
        fontSize: 80,
        color: color,
      ),
    );
  }
}

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            ref.read(randomColorProvider.notifier).randomColor();
          },
          tooltip: 'Change Color',
          child: const Icon(Icons.color_lens),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).decrement();
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).multiply();
          },
          tooltip: 'Multiply',
          child: const Icon(Icons.close),
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).reset();
          },
          tooltip: 'Reset',
          child: const Icon(Icons.exposure_zero),
        ),
      ],
    );
  }
}
