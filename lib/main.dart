import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MentalMathApp());
}

class MentalMathApp extends StatelessWidget {
  const MentalMathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cálculo Mental',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final TextEditingController answerController = TextEditingController();
  final Random random = Random();

  int number1 = 0;
  int number2 = 0;
  int number3 = 0;
  int number4 = 0;
  double correctAnswer = 0;

  String operation = '+';
  String message = '';

  int score = 0;

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  void generateQuestion() {
    final operations = [
      '+',
      '-',
      '×',
      '÷',
      'c1',
      'c2',
      'e1',
      'e2',
    ]; // c1 para (a + b) × c, c2 para (a - b) × c
    // e1 para ecuaciones simples (ax + b = cx)
    // e2 para ecuaciones más

    operation = operations[random.nextInt(operations.length)];

    switch (operation) {
      case '+':
        number1 = random.nextInt(1000) + 1;
        number2 = random.nextInt(1000) + 1;
        correctAnswer = (number1 + number2) as double;
        break;

      case '-':
        number1 = random.nextInt(1000) + 1;
        number2 = random.nextInt(1000) + 1;

        // Evitamos resultados negativos.
        if (number2 > number1) {
          final temp = number1;
          number1 = number2;
          number2 = temp;
        }

        correctAnswer = (number1 - number2) as double;
        break;

      case '×':
        number1 = random.nextInt(12) + 1;
        number2 = random.nextInt(12) + 1;
        correctAnswer = (number1 * number2) as double;
        break;

      case '÷':
        // Primero generamos divisor y resultado.
        number2 = random.nextInt(10) + 1;
        correctAnswer = random.nextInt(10) + 1;

        // Después calculamos el dividendo.
        number1 = (number2 * correctAnswer) as int;
        break;
      case 'c1':
        number1 = random.nextInt(20) + 1; // a
        number2 = random.nextInt(20) + 1; // b
        number3 = random.nextInt(10) + 1; // c
        // Calculos combinados: (a + b) × c
        correctAnswer = (number1 + number2) * number3 as double;
        break;
      case 'c2':
        number1 = random.nextInt(20) + 1; // a
        number2 = random.nextInt(20) + 1; // b
        number3 = random.nextInt(10) + 1; // c
        // Calculos combinados: (a - b) × c
        correctAnswer = (number1 - number2) * number3 as double;
        break;
      case 'e1':
        number1 = random.nextInt(20) + 1; // a
        number2 = random.nextInt(20) + 1; // b
        number3 = random.nextInt(10) + 1; // c
        // Calculos combinados: ax + b = cx  x(a - c) = -b  x = -b/(a-c)
        correctAnswer = -number2 / (number1 - number3);
        break;
      case 'e2':
        number1 = random.nextInt(20) + 1; // a
        number2 = random.nextInt(20) + 1; // b
        number3 = random.nextInt(10) + 1; // c
        // Calculos combinados: ax + b = cx + d  x(a - c) = d - b  x = (d-b)/(a-c)
        number4 = random.nextInt(10) + 1; // d
        correctAnswer = (number4 - number2) / (number1 - number3);
        break;
    }
  }

  void checkAnswer() {
    final userAnswer = int.tryParse(answerController.text);

    if (userAnswer == correctAnswer) {
      setState(() {
        score += 10;
        message = '¡Correcto! 🎉';

        generateQuestion();
        answerController.clear();
      });
    } else {
      setState(() {
        message = 'Incorrecto 😕';
      });
    }
  }

  @override
  void dispose() {
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo Mental')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Puntos: $score',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              const Text('¿Cuánto es?', style: TextStyle(fontSize: 24)),

              const SizedBox(height: 20),

              Text(
                {
                      '+': '$number1 + $number2 = ?',
                      '-': '$number1 - $number2 = ?',
                      '×': '$number1 × $number2 = ?',
                      '÷': '$number1 ÷ $number2 = ?',
                      'c1': '($number1 + $number2) × $number3 = ?',
                      'c2': '($number1 - $number2) × $number3 = ?',
                      'e1': '$number1 x + $number2 = $number3 x',
                      'e2': '$number1 x + $number2 = $number3 x + $number4',
                    }[operation] ??
                    '$number1 $operation $number2 = ?',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: answerController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tu respuesta',
                ),
                onSubmitted: (_) => checkAnswer(),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: checkAnswer,
                child: const Text('Comprobar'),
              ),

              const SizedBox(height: 20),

              Text(
                message,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    message = '';
                    generateQuestion();
                    answerController.clear();
                  });
                },
                child: const Text('Siguiente pregunta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
