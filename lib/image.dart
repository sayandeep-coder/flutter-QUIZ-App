import 'package:flutter/material.dart';

class ImageBtn extends StatelessWidget {
  const ImageBtn(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(100, 255, 255, 255),
        ),
        const SizedBox(height: 50),
        const Text(
          'Learn Flutter the Fun Way!',
          style: TextStyle(
            color: Color.fromARGB(247, 255, 255, 255),
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 50),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
