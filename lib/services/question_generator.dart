import 'dart:math';

import 'package:calculo_mental/generators/arithmetic_generator.dart';
import 'package:calculo_mental/generators/equation_generator.dart';
import 'package:calculo_mental/generators/function_generator.dart';
import 'package:calculo_mental/generators/power_generator.dart';
import 'package:calculo_mental/generators/root_generator.dart';
import 'package:calculo_mental/models/question_type.dart';

import '../models/question.dart';

class QuestionGenerator {
  final Random _random = Random();
  final ArithmeticGenerator _arithmetic = ArithmeticGenerator();
  final EquationGenerator _equations = EquationGenerator(); 
  final FunctionGenerator _functions = FunctionGenerator();
  final PowerGenerator _powers = PowerGenerator();
  final RootGenerator _roots = RootGenerator();

  Question generate() {
    final type = _randomQuestionType();

    switch (type) {
      // Operaciones básicas
      case QuestionType.addition:
        return _arithmetic.addition();

      case QuestionType.additionTwo:
        return _arithmetic.additionTwo();

      case QuestionType.subtraction:
        return _arithmetic.subtraction();

      case QuestionType.subtractionTwo:
        return _arithmetic.subtractionTwo();

      case QuestionType.multiplication:
        return _arithmetic.multiplication();

      case QuestionType.multiplicationTwo:
        return _arithmetic.multiplicationTwo();

      case QuestionType.division:
        return _arithmetic.division();

      // Operaciones combinadas
      case QuestionType.combinedAddition:
        return _arithmetic.combinedAddition();

      case QuestionType.combinedSubtraction:
        return _arithmetic.combinedSubtraction();

      // Ecuaciones
      case QuestionType.equationOne:
        return _equations.simple();

      case QuestionType.equationTwo:
        return _equations.withTwoTerms();

      // Composición de funciones
      case QuestionType.composition:
        return _functions.composition();

      // Operaciones entre funciones
      case QuestionType.functionAddition:
        return _functions.addition();

      case QuestionType.functionSubtraction:
        return _functions.subtraction();

      case QuestionType.functionMultiplication:
        return _functions.multiplication();

      case QuestionType.functionDivision:
        return _functions.division();

      // Potencias
      case QuestionType.power:
        return _powers.power();

      // Raíces
      case QuestionType.perfectSquareRoot:
        return _roots.perfectSquareRoot();
    }
  }

  QuestionType _randomQuestionType() {
    const types = QuestionType.values;

    return types[_random.nextInt(types.length)];
  }

}