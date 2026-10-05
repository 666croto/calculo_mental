import 'dart:math';

import 'package:calculo_mental/generators/arithmetic_generator.dart';
import 'package:calculo_mental/generators/equation_generator.dart';
import 'package:calculo_mental/generators/function_generator.dart';
import 'package:calculo_mental/generators/power_generator.dart';
import 'package:calculo_mental/generators/root_generator.dart';
import 'package:calculo_mental/models/question.dart';
import 'package:calculo_mental/models/question_type.dart';

class QuestionGenerator {
  final Random _random;

  final ArithmeticGenerator _arithmetic;
  final EquationGenerator _equations;
  final FunctionGenerator _functions;
  final PowerGenerator _powers;
  final RootGenerator _roots;

  QuestionGenerator({
    Random? random,
  })  : _random = random ?? Random(),
        _arithmetic = ArithmeticGenerator(),
        _equations = EquationGenerator(),
        _functions = FunctionGenerator(),
        _powers = PowerGenerator(),
        _roots = RootGenerator();

  Question generate() {
    return switch (_randomQuestionType()) {
      QuestionType.addition => _arithmetic.addition(),
      QuestionType.additionTwo => _arithmetic.additionTwo(),
      QuestionType.subtraction => _arithmetic.subtraction(),
      QuestionType.subtractionTwo => _arithmetic.subtractionTwo(),
      QuestionType.multiplication => _arithmetic.multiplication(),
      QuestionType.multiplicationTwo => _arithmetic.multiplicationTwo(),
      QuestionType.division => _arithmetic.division(),
      QuestionType.combinedAddition => _arithmetic.combinedAddition(),
      QuestionType.combinedSubtraction => _arithmetic.combinedSubtraction(),

      QuestionType.equationOne => _equations.simple(),
      QuestionType.equationTwo => _equations.withTwoTerms(),

      QuestionType.composition => _functions.composition(),
      QuestionType.functionAddition => _functions.addition(),
      QuestionType.functionSubtraction => _functions.subtraction(),
      QuestionType.functionMultiplication => _functions.multiplication(),
      QuestionType.functionDivision => _functions.division(),

      QuestionType.power => _powers.power(),
      QuestionType.perfectSquareRoot => _roots.perfectSquareRoot(),
    };
  }

  QuestionType _randomQuestionType() {
    final types = QuestionType.values;
    return types[_random.nextInt(types.length)];
  }
}