import 'dart:math';

import 'package:calculo_mental/models/question.dart';
import 'package:calculo_mental/utils/helper.dart';

class PowerGenerator {
  final Helper helper = Helper();

  Question power() {
    final base = helper.randomInt(10);

    // Exponentes pequeños para evitar números enormes.
    final exponent = helper.random.nextInt(4) + 2;

    final answer = pow(base, exponent).toDouble();

    return Question(
      text: '$base${_superscript(exponent)} = ?',
      answer: answer,
    );
  }

  String _superscript(int number) {
  const digits = {
    '0': '⁰',
    '1': '¹',
    '2': '²',
    '3': '³',
    '4': '⁴',
    '5': '⁵',
    '6': '⁶',
    '7': '⁷',
    '8': '⁸',
    '9': '⁹',
  };

  return number
      .toString()
      .split('')
      .map((digit) => digits[digit]!)
      .join();
}
}