import 'dart:math';

import 'package:calculo_mental/models/question.dart';
import 'package:calculo_mental/utils/helper.dart';

class ArithmeticGenerator {
  final Helper _helper = Helper();


  Question addition() {
    final a = _helper.randomInt(1000);
    final b = _helper.randomInt(1000);

    return Question(
      text: '$a + $b = ?',
      answer: (a + b).toDouble(),
    );
  }

  Question subtraction() {
    var a = _helper.randomInt(1000);
    var b = _helper.randomInt(1000);

    if (b > a) {
      (a, b) = (b, a);
    }

    return Question(
      text: '$a - $b = ?',
      answer: (a - b).toDouble(),
    );
  }
  

  Question additionTwo() {
    final a = _helper.randomInt(1000);
    final b = _helper.randomInt(1000);
    final c = _helper.randomInt(1000);

    return Question(
      text: '$a + $b + $c = ?',
      answer: (a + b + c).toDouble(),
    );
  }

    Question subtractionTwo() {
    final a = _helper.randomInt(1000);
    final b = _helper.randomInt(1000);
    final c = _helper.randomInt(1000);

    return Question(
      text: '$a - $b - $c = ?',
      answer: (a - b - c).toDouble(),
    );
  }

  Question multiplication() {
    final a = _helper.randomInt(12);
    final b = _helper.randomInt(12);

    return Question(
      text: '$a × $b = ?',
      answer: (a * b).toDouble(),
    );
  }

  Question multiplicationTwo() {
    final a = _helper.randomInt(9);
    final b = _helper.randomInt(9);
    final c = _helper.randomInt(9);

    return Question(
      text: '$a × $b × $c = ?',
      answer: (a * b * c).toDouble(),
    );
  }

  Question division() {
    final divisor = _helper.randomInt(10);
    final result = _helper.randomInt(10);

    final dividend = divisor * result;

    return Question(
      text: '$dividend ÷ $divisor = ?',
      answer: result.toDouble(),
    );
  }

  Question combinedAddition() {
    final a = _helper.randomInt(20);
    final b = _helper.randomInt(20);
    final c = _helper.randomInt(10);

    final answer = (a + b) * c;

    return Question(
      text: '($a + $b) × $c = ?',
      answer: answer.toDouble(),
    );
  }

  Question combinedSubtraction() {
    var a = _helper.randomInt(20);
    var b = _helper.randomInt(20);
    final c = _helper.randomInt(10);

    if (b > a) {
      final temp = a;
      a = b;
      b = temp;
    }

    final answer = (a - b) * c;

    return Question(
      text: '($a - $b) × $c = ?',
      answer: answer.toDouble(),
    );
  }
}