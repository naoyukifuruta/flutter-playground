import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_color.g.dart';

@riverpod
class RandomColor extends _$RandomColor {
  @override
  Color build() => Colors.black;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  void randomColor() {
    state = _colors[Random().nextInt(_colors.length)];
  }
}
