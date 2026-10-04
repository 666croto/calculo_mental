import 'dart:math';

import '../models/question.dart';

class QuestionGenerator {
  final Random _random = Random();

  Question generate() {
    final type = _randomQuestionType();

    switch (type) {
      // Operaciones básicas
      case QuestionType.addition:
        return _addition();

      case QuestionType.additionTwo:
        return _additionTwo();

      case QuestionType.subtraction:
        return _subtraction();

      case QuestionType.subtractionTwo:
        return _subtractionTwo();

      case QuestionType.multiplication:
        return _multiplication();

      case QuestionType.multiplicationTwo:
        return _multiplicationTwo();

      case QuestionType.division:
        return _division();

      // Operaciones combinadas
      case QuestionType.combinedAddition:
        return _combinedAddition();

      case QuestionType.combinedSubtraction:
        return _combinedSubtraction();

      // Ecuaciones
      case QuestionType.equationOne:
        return _equationOne();

      case QuestionType.equationTwo:
        return _equationTwo();

      // Composición de funciones
      case QuestionType.composition:
        return _composition();

      // Operaciones entre funciones
      case QuestionType.functionAddition:
        return _functionAddition();

      case QuestionType.functionSubtraction:
        return _functionSubtraction();

      case QuestionType.functionMultiplication:
        return _functionMultiplication();

      case QuestionType.functionDivision:
        return _functionDivision();

      // Potencias
      case QuestionType.power:
        return _power();

      // Raíces
      case QuestionType.perfectSquareRoot:
        return _perfectSquareRoot();
    }
  }

  // ------------------------------------------------------------
  // TIPOS DE PREGUNTA
  // ------------------------------------------------------------

  QuestionType _randomQuestionType() {
    const types = QuestionType.values;

    return types[_random.nextInt(types.length)];
  }

  // ------------------------------------------------------------
  // HELPERS
  // ------------------------------------------------------------

  int _randomInt(int max) {
    return _random.nextInt(max) + 1;
  }

  int _randomSignedInt(int max) {
    return _random.nextInt(max * 2 + 1) - max;
  }

  bool _hasAtMostTwoDecimals(double value) {
    return (value * 100).roundToDouble() == value * 100;
  }

  String _formatLinearFunction(int a, int b) {
    if (b == 0) {
      return '${a}x';
    }

    if (b > 0) {
      return '${a}x + $b';
    }

    return '${a}x - ${-b}';
  }

  // ------------------------------------------------------------
  // OPERACIONES BÁSICAS
  // ------------------------------------------------------------

  Question _addition() {
    final a = _randomInt(1000);
    final b = _randomInt(1000);

    return Question(
      text: '$a + $b = ?',
      answer: (a + b).toDouble(),
    );
  }

  Question _additionTwo() {
    final a = _randomInt(1000);
    final b = _randomInt(1000);
    final c = _randomInt(1000);

    return Question(
      text: '$a + $b + $c = ?',
      answer: (a + b + c).toDouble(),
    );
  }

  Question _subtraction() {
    var a = _randomInt(1000);
    var b = _randomInt(1000);

    if (b > a) {
      final temp = a;
      a = b;
      b = temp;
    }

    return Question(
      text: '$a - $b = ?',
      answer: (a - b).toDouble(),
    );
  }

  Question _subtractionTwo() {
    final a = _randomInt(1000);
    final b = _randomInt(1000);
    final c = _randomInt(1000);

    return Question(
      text: '$a - $b - $c = ?',
      answer: (a - b - c).toDouble(),
    );
  }

  Question _multiplication() {
    final a = _randomInt(12);
    final b = _randomInt(12);

    return Question(
      text: '$a × $b = ?',
      answer: (a * b).toDouble(),
    );
  }

  Question _multiplicationTwo() {
    final a = _randomInt(9);
    final b = _randomInt(9);
    final c = _randomInt(9);

    return Question(
      text: '$a × $b × $c = ?',
      answer: (a * b * c).toDouble(),
    );
  }

  Question _division() {
    final divisor = _randomInt(10);
    final result = _randomInt(10);

    final dividend = divisor * result;

    return Question(
      text: '$dividend ÷ $divisor = ?',
      answer: result.toDouble(),
    );
  }

  // ------------------------------------------------------------
  // OPERACIONES COMBINADAS
  // ------------------------------------------------------------

  Question _combinedAddition() {
    final a = _randomInt(20);
    final b = _randomInt(20);
    final c = _randomInt(10);

    final answer = (a + b) * c;

    return Question(
      text: '($a + $b) × $c = ?',
      answer: answer.toDouble(),
    );
  }

  Question _combinedSubtraction() {
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

  // ------------------------------------------------------------
  // ECUACIONES
  // ------------------------------------------------------------

  Question _equationOne() {
    while (true) {
      final a = _randomInt(20);
      final b = _randomInt(20);
      final c = _randomInt(10);

      if (a == c) {
        continue;
      }

      final answer = -b / (a - c);

      if (!_hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text: '$a x + $b = $c x',
        answer: answer,
      );
    }
  }

  Question _equationTwo() {
    while (true) {
      final a = _randomInt(20);
      final b = _randomInt(20);
      final c = _randomInt(10);
      final d = _randomInt(10);

      if (a == c) {
        continue;
      }

      final answer = (d - b) / (a - c);

      if (!_hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text: '$a x + $b = $c x + $d',
        answer: answer,
      );
    }
  }

  // ------------------------------------------------------------
  // COMPOSICIÓN DE FUNCIONES
  // ------------------------------------------------------------

  Question _composition() {
    // f(x) = ax + b
    final a = _randomInt(5);
    final b = _randomSignedInt(5);

    // g(x) = cx + d
    final c = _randomInt(5);
    final d = _randomSignedInt(5);

    final x = _randomInt(10);

    // Primero g(x)
    final gx = c * x + d;

    // Después f(g(x))
    final answer = a * gx + b;

    return Question(
      text:
          'f(x) = ${_formatLinearFunction(a, b)}\n'
          'g(x) = ${_formatLinearFunction(c, d)}\n\n'
          'f(g($x)) = ?',
      answer: answer.toDouble(),
    );
  }

  // ------------------------------------------------------------
  // OPERACIONES ENTRE FUNCIONES
  // ------------------------------------------------------------

  Question _functionAddition() {
    final a = _randomInt(5);
    final b = _randomSignedInt(5);

    final c = _randomInt(5);
    final d = _randomSignedInt(5);

    final x = _randomInt(10);

    final fx = a * x + b;
    final gx = c * x + d;

    final answer = fx + gx;

    return Question(
      text:
          'f(x) = ${_formatLinearFunction(a, b)}\n'
          'g(x) = ${_formatLinearFunction(c, d)}\n\n'
          '(f + g)($x) = ?',
      answer: answer.toDouble(),
    );
  }

  Question _functionSubtraction() {
    final a = _randomInt(5);
    final b = _randomSignedInt(5);

    final c = _randomInt(5);
    final d = _randomSignedInt(5);

    final x = _randomInt(10);

    final fx = a * x + b;
    final gx = c * x + d;

    final answer = fx - gx;

    return Question(
      text:
          'f(x) = ${_formatLinearFunction(a, b)}\n'
          'g(x) = ${_formatLinearFunction(c, d)}\n\n'
          '(f - g)($x) = ?',
      answer: answer.toDouble(),
    );
  }

  Question _functionMultiplication() {
    final a = _randomInt(5);
    final b = _randomSignedInt(5);

    final c = _randomInt(5);
    final d = _randomSignedInt(5);

    final x = _randomInt(5);

    final fx = a * x + b;
    final gx = c * x + d;

    final answer = fx * gx;

    return Question(
      text:
          'f(x) = ${_formatLinearFunction(a, b)}\n'
          'g(x) = ${_formatLinearFunction(c, d)}\n\n'
          '(f × g)($x) = ?',
      answer: answer.toDouble(),
    );
  }

  Question _functionDivision() {
    while (true) {
      final a = _randomInt(5);
      final b = _randomSignedInt(5);

      final c = _randomInt(5);
      final d = _randomSignedInt(5);

      final x = _randomInt(10);

      final fx = a * x + b;
      final gx = c * x + d;

      // Evitamos dividir por cero.
      if (gx == 0) {
        continue;
      }

      final answer = fx / gx;

      // Solo resultados con máximo dos decimales.
      if (!_hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text:
            'f(x) = ${_formatLinearFunction(a, b)}\n'
            'g(x) = ${_formatLinearFunction(c, d)}\n\n'
            '(f ÷ g)($x) = ?',
        answer: answer,
      );
    }
  }

  // ------------------------------------------------------------
  // POTENCIAS
  // ------------------------------------------------------------

  Question _power() {
    final base = _randomInt(10);

    // Exponentes pequeños para evitar números enormes.
    final exponent = _random.nextInt(4) + 2;

    final answer = pow(base, exponent).toDouble();

    return Question(
      text: '$base^$exponent = ?',
      answer: answer,
    );
  }

  // ------------------------------------------------------------
  // RAÍCES CUADRADAS PERFECTAS
  // ------------------------------------------------------------

  Question _perfectSquareRoot() {
    // Elegimos primero la raíz.
    final root = _randomInt(20);

    // Construimos el cuadrado perfecto.
    final number = root * root;

    return Question(
      text: '√$number = ?',
      answer: root.toDouble(),
    );
  }
}

// ============================================================
// TIPOS DE PREGUNTA
// ============================================================

enum QuestionType {
  // Operaciones básicas
  addition,
  additionTwo,
  subtraction,
  subtractionTwo,
  multiplication,
  multiplicationTwo,
  division,

  // Operaciones combinadas
  combinedAddition,
  combinedSubtraction,

  // Ecuaciones
  equationOne,
  equationTwo,

  // Funciones
  composition,

  // Operaciones entre funciones
  functionAddition,
  functionSubtraction,
  functionMultiplication,
  functionDivision,

  // Potencias
  power,

  // Raíces
  perfectSquareRoot,
}

