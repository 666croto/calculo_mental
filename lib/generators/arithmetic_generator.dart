import 'dart:math';

import 'package:calculo_mental/models/question.dart';

class ArithmeticGenerator {
  final Random _random;

  ArithmeticGenerator({
    Random? random,
  }) : _random = random ?? Random();

  Question addition() {
    final a = _randomInt(1000);
    final b = _randomInt(1000);

    return Question(
      text: '$a + $b = ?',
      answer: (a + b).toDouble(),
    );
  }

  Question subtraction() {
    var a = _randomInt(1000);
    var b = _randomInt(1000);

    if (b > a) {
      (a, b) = (b, a);
    }

    return Question(
      text: '$a - $b = ?',
      answer: (a - b).toDouble(),
    );
  }
  
  int _randomInt(int max) {
    return _random.nextInt(max) + 1;
  }

  Question additionTwo() {
    final a = _randomInt(1000);
    final b = _randomInt(1000);
    final c = _randomInt(1000);

    return Question(
      text: '$a + $b + $c = ?',
      answer: (a + b + c).toDouble(),
    );
  }

    Question subtractionTwo() {
    final a = _randomInt(1000);
    final b = _randomInt(1000);
    final c = _randomInt(1000);

    return Question(
      text: '$a - $b - $c = ?',
      answer: (a - b - c).toDouble(),
    );
  }

  Question multiplication() {
    final a = _randomInt(12);
    final b = _randomInt(12);

    return Question(
      text: '$a × $b = ?',
      answer: (a * b).toDouble(),
    );
  }

  Question multiplicationTwo() {
    final a = _randomInt(9);
    final b = _randomInt(9);
    final c = _randomInt(9);

    return Question(
      text: '$a × $b × $c = ?',
      answer: (a * b * c).toDouble(),
    );
  }

  Question division() {
    final divisor = _randomInt(10);
    final result = _randomInt(10);

    final dividend = divisor * result;

    return Question(
      text: '$dividend ÷ $divisor = ?',
      answer: result.toDouble(),
    );
  }

  Question combinedAddition() {
    final a = _randomInt(20);
    final b = _randomInt(20);
    final c = _randomInt(10);

    final answer = (a + b) * c;

    return Question(
      text: '($a + $b) × $c = ?',
      answer: answer.toDouble(),
    );
  }

  Question combinedSubtraction() {
    var a = _randomInt(20);
    var b = _randomInt(20);
    final c = _randomInt(10);

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