
import 'package:calculo_mental/models/question.dart';
import 'package:calculo_mental/utils/helper.dart';

class EquationGenerator {
  final Helper _helper = Helper();

  Question simple() {
    while (true) {
      final a = _helper.randomInt(20);
      final b = _helper.randomInt(20);
      final c = _helper.randomInt(10);

      if (a == c) {
        continue;
      }

      final answer = -b / (a - c);

      if (!_helper.hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text: '$a x + $b = $c x',
        answer: answer,
      );
    }
  }

  Question withTwoTerms() {
    while (true) {
      final a = _helper.randomInt(20);
      final b = _helper.randomInt(20);
      final c = _helper.randomInt(10);
      final d = _helper.randomInt(10);

      if (a == c) {
        continue;
      }

      final answer = (d - b) / (a - c);

      if (!_helper.hasAtMostTwoDecimals(answer)) {
        continue;
      }

      return Question(
        text: '$a x + $b = $c x + $d',
        answer: answer,
      );
    }
  }

}