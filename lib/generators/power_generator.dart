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
      text: '$base^$exponent = ?',
      answer: answer,
    );
  }
}