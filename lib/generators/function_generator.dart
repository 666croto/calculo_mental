import 'package:calculo_mental/models/question.dart';
import 'package:calculo_mental/utils/helper.dart';

class FunctionGenerator {
    final Helper helper = Helper();

  Question composition() {
    // f(x) = ax + b
    final a = helper.randomInt(5);
    final b = helper.randomSignedInt(5);

    // g(x) = cx + d
    final c = helper.randomInt(5);
    final d = helper.randomSignedInt(5);

    final x = helper.randomInt(10);

    // Primero g(x)
    final gx = c * x + d;

    // Después f(g(x))
    final answer = a * gx + b;

    return Question(
      text:
          'f(x) = ${helper.formatLinearFunction(a, b)}\n'
          'g(x) = ${helper.formatLinearFunction(c, d)}\n\n'
          'f(g($x)) = ?',
      answer: answer.toDouble(),
    );
  }

  Question addition() {
    final a = helper.randomInt(5);
    final b = helper.randomSignedInt(5);

    final c = helper.randomInt(5);
    final d = helper.randomSignedInt(5);

    final x = helper.randomInt(10);

    final fx = a * x + b;
    final gx = c * x + d;

    final answer = fx + gx;

    return Question(
      text:
          'f(x) = ${helper.formatLinearFunction(a, b)}\n'
          'g(x) = ${helper.formatLinearFunction(c, d)}\n\n'
          '(f + g)($x) = ?',
      answer: answer.toDouble(),
    );
  }

  Question subtraction() {
    final a = helper.randomInt(5);
    final b = helper.randomSignedInt(5);

    final c = helper.randomInt(5);
    final d = helper.randomSignedInt(5);

    final x = helper.randomInt(10);

    final fx = a * x + b;
    final gx = c * x + d;

    final answer = fx - gx;

    return Question(
      text:
          'f(x) = ${helper.formatLinearFunction(a, b)}\n'
          'g(x) = ${helper.formatLinearFunction(c, d)}\n\n'
          '(f - g)($x) = ?',
      answer: answer.toDouble(),
    );
  }

  Question multiplication() {
    final a = helper.randomInt(5);
    final b = helper.randomSignedInt(5);

    final c = helper.randomInt(5);
    final d = helper.randomSignedInt(5);

    final x = helper.randomInt(5);

    final fx = a * x + b;
    final gx = c * x + d;

    final answer = fx * gx;

    return Question(
      text:
          'f(x) = ${helper.formatLinearFunction(a, b)}\n'
          'g(x) = ${helper.formatLinearFunction(c, d)}\n\n'
          '(f × g)($x) = ?',
      answer: answer.toDouble(),
    );
  }

  Question division() {
    while (true) {
      final a = helper.randomInt(5);
      final b = helper.randomSignedInt(5);

      final c = helper.randomInt(5);
      final d = helper.randomSignedInt(5);

      final x = helper.randomInt(10);

      final fx = a * x + b;
      final gx = c * x + d;

      // Evitamos dividir por cero.
      if (gx == 0) {
        continue;
      }

      final answer = fx / gx;

      // Solo resultados con máximo dos decimales.
      if (!helper.hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text:
            'f(x) = ${helper.formatLinearFunction(a, b)}\n'
            'g(x) = ${helper.formatLinearFunction(c, d)}\n\n'
            '(f ÷ g)($x) = ?',
        answer: answer,
      );
    }
  }
}
