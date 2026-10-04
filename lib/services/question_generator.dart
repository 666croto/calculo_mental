import 'dart:math';

import '../models/question.dart';

class QuestionGenerator {
  final Random _random = Random();

  Question generate() {
    final operations = [
      '+',
      '-',
      '×',
      'x2',
      '÷',
      'c1',
      'c2',
      'e1',
      'e2',
    ];

    final operation =
        operations[_random.nextInt(operations.length)];

    switch (operation) {
      case '+':
        return _addition();
      
      case '+2':
        return _additionTwo();

      case '-':
        return _subtraction();

      case '×':
        return _multiplication();

      case 'x2':
        return _multiplicationTwo();

      case '÷':
        return _division();

      case 'c1':
        return _combinedAddition();

      case 'c2':
        return _combinedSubtraction();

      case 'e1':
        return _equationOne();

      case 'e2':
        return _equationTwo();

      default:
        return _addition();
    }
  }

  // Verifica que el número tenga como máximo
  // dos decimales.
  bool _hasAtMostTwoDecimals(double value) {
    return (value * 100).roundToDouble() == value * 100;
  }

  Question _addition() {
    final number1 = _random.nextInt(1000) + 1;
    final number2 = _random.nextInt(1000) + 1;

    return Question(
      text: '$number1 + $number2 = ?',
      answer: (number1 + number2).toDouble(),
    );
  }

  Question _subtraction() {
    var number1 = _random.nextInt(1000) + 1;
    var number2 = _random.nextInt(1000) + 1;

    if (number2 > number1) {
      final temp = number1;
      number1 = number2;
      number2 = temp;
    }

    return Question(
      text: '$number1 - $number2 = ?',
      answer: (number1 - number2).toDouble(),
    );
  }

  Question _multiplication() {
    final number1 = _random.nextInt(12) + 1;
    final number2 = _random.nextInt(12) + 1;

    return Question(
      text: '$number1 × $number2 = ?',
      answer: (number1 * number2).toDouble(),
    );
  }

  Question _division() {
    final divisor = _random.nextInt(10) + 1;
    final result = _random.nextInt(10) + 1;

    final dividend = divisor * result;

    return Question(
      text: '$dividend ÷ $divisor = ?',
      answer: result.toDouble(),
    );
  }

  Question _combinedAddition() {
    final number1 = _random.nextInt(20) + 1;
    final number2 = _random.nextInt(20) + 1;
    final number3 = _random.nextInt(10) + 1;

    final answer = (number1 + number2) * number3;

    return Question(
      text: '($number1 + $number2) × $number3 = ?',
      answer: answer.toDouble(),
    );
  }

  Question _combinedSubtraction() {
    var number1 = _random.nextInt(20) + 1;
    var number2 = _random.nextInt(20) + 1;
    final number3 = _random.nextInt(10) + 1;

    if (number2 > number1) {
      final temp = number1;
      number1 = number2;
      number2 = temp;
    }

    final answer = (number1 - number2) * number3;

    return Question(
      text: '($number1 - $number2) × $number3 = ?',
      answer: answer.toDouble(),
    );
  }

  Question _equationOne() {
    while (true) {
      final number1 = _random.nextInt(20) + 1;
      final number2 = _random.nextInt(20) + 1;
      final number3 = _random.nextInt(10) + 1;

      // Evitamos división por cero.
      if (number1 == number3) {
        continue;
      }

      final answer =
          -number2 / (number1 - number3);

      // Evitamos números periódicos o con más
      // de dos decimales.
      if (!_hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text: '$number1 x + $number2 = $number3 x',
        answer: answer,
      );
    }
  }

  Question _equationTwo() {
    while (true) {
      final number1 = _random.nextInt(20) + 1;
      final number2 = _random.nextInt(20) + 1;
      final number3 = _random.nextInt(10) + 1;
      final number4 = _random.nextInt(10) + 1;

      // Evitamos división por cero.
      if (number1 == number3) {
        continue;
      }

      final answer =
          (number4 - number2) / (number1 - number3);

      // Evitamos números periódicos o con más
      // de dos decimales.
      if (!_hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text:
            '$number1 X + $number2 = $number3 X + $number4',
        answer: answer,
      );
    }
  }

  Question _multiplicationTwo() {
    final number1 = _random.nextInt(9) + 1;
    final number2 = _random.nextInt(9) + 1;
    final number3 = _random.nextInt(9) + 1;

    return Question(
      text: '$number1 × $number2 x $number3= ?',
      answer: (number1 * number2 * number3).toDouble(),
    );
  }

  Question _additionTwo() {
    final number1 = _random.nextInt(1000) + 1;
    final number2 = _random.nextInt(1000) + 1;
    final number3 = _random.nextInt(1000) + 1;

    return Question(
      text: '$number1 + $number2 + $number3 = ?',
      answer: (number1 + number2 + number3).toDouble(),
    );
  }
}