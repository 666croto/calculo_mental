import 'package:flutter/material.dart';

import '../models/question.dart';
import '../services/question_generator.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static const Color primaryColor = Color(0xFF7700FF);
  static const Color accentColor = Color(0xFFF0FF24);
  static const Color darkColor = Color(0xFF111111);

  final TextEditingController _answerController =
      TextEditingController();

  final QuestionGenerator _questionGenerator =
      QuestionGenerator();

  late Question _question;
  int _streak = 0;
  int _totalCorrect = 0;
  int _totalIncorrect = 0;

  String _message = '';

  bool get _hasMessage => _message.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    _question = _questionGenerator.generate();
  }

  void _checkAnswer() {
    final text =
        _answerController.text.trim().replaceAll(',', '.');

    final userAnswer = double.tryParse(text);

    if (userAnswer == null) {
      setState(() {
        _message = 'Escribe una respuesta válida';
      });
      return;
    }

    final difference =
        (userAnswer - _question.answer).abs();

    final isCorrect = difference < 0.0001;

    if (isCorrect) {
      setState(() {
        _streak++;
        _totalCorrect++;
        _message = '¡Correcto! 🎉';

        _generateQuestion();
        _answerController.clear();
      });
    } else {
      setState(() {
        _streak = 0;
        _totalIncorrect++;
        _message = 'Incorrecto 😕';
      });
    }
  }

  void _nextQuestion() {
    setState(() {
      _message = '';
      _answerController.clear();
      _generateQuestion();
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cálculo Mental',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),

              child: Column(
                children: [
                  _buildStats(),

                  const SizedBox(height: 30),

                  _buildQuestionCard(),

                  const SizedBox(height: 25),

                  _buildAnswerField(),

                  const SizedBox(height: 18),

                  _buildCheckButton(),

                  const SizedBox(height: 18),

                  _buildMessage(),

                  const SizedBox(height: 10),

                  _buildNextButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            icon: '🔥',
            value: '$_streak',
            label: 'Racha',
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _buildStatCard(
            icon: '✅',
            value: '$_totalCorrect',
            label: 'Aciertos',
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _buildStatCard(
            icon: '❌',
            value: '$_totalIncorrect',
            label: 'Errores',
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 8,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 22),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        children: [
          const Text(
            '¿CUÁNTO ES?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            _question.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerField() {
    return TextField(
      controller: _answerController,

      keyboardType:
          const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),

      textAlign: TextAlign.center,

      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),

      decoration: InputDecoration(
        hintText: 'Tu respuesta',

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),

      onSubmitted: (_) => _checkAnswer(),
    );
  }

  Widget _buildCheckButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(
        onPressed: _checkAnswer,

        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,

          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        child: const Text(
          'COMPROBAR',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildMessage() {
    if (!_hasMessage) {
      return const SizedBox(height: 30);
    }

    final isCorrect = _message.contains('Correcto');

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),

      width: double.infinity,

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: isCorrect
            ? accentColor.withValues(alpha: 0.35)
            : Colors.red.withValues(alpha: 0.08),

        borderRadius: BorderRadius.circular(14),
      ),

      child: Text(
        _message,
        textAlign: TextAlign.center,

        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isCorrect
              ? Colors.black
              : Colors.red.shade700,
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return TextButton(
      onPressed: _nextQuestion,

      child: const Text(
        'Siguiente pregunta →',
        style: TextStyle(
          color: primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}