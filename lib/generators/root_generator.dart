import 'package:calculo_mental/models/question.dart';
import 'package:calculo_mental/utils/helper.dart';

class RootGenerator {
  final Helper helper = Helper();
  Question perfectSquareRoot() {
    // Elegimos primero la raíz.
    final root = helper.randomInt(20);

    // Construimos el cuadrado perfecto.
    final number = root * root;

    return Question(
      text: '√$number = ?',
      answer: root.toDouble(),
    );
  }
}