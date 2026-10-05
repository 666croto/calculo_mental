import 'dart:core';
import 'dart:math';

class Helper {
  final Random _random = Random();

  get random => _random;


  int randomInt(int max) {
    return _random.nextInt(max) + 1;
  }

  int randomSignedInt(int max) {
    return _random.nextInt(max * 2 + 1) - max;
  }

  bool hasAtMostTwoDecimals(double value) {
    return (value * 100).roundToDouble() == value * 100;
  }

  String formatLinearFunction(int a, int b) {
    if (b == 0) {
      return '${a}x';
    }

    if (b > 0) {
      return '${a}x + $b';
    }

    return '${a}x - ${-b}';
  }
}