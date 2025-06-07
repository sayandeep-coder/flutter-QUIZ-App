import 'package:flutter/material.dart';
import 'package:quiz/image.dart';

class ColorQuiz extends StatelessWidget {
  const ColorQuiz(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 94, 12, 124),
            Color.fromARGB(255, 95, 13, 127),
          ],
        ),
      ),
      child: Center(
        child: ImageBtn(startQuiz),
      ),
    );
  }
}
