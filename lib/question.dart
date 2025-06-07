import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/ques.dart';
import 'package:google_fonts/google_fonts.dart';


class QuizQuestions extends StatefulWidget {
  const QuizQuestions({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer ;

  @override
  State<QuizQuestions> createState() {
    return _QuizQuestions();
  }
}

class _QuizQuestions extends State<QuizQuestions> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {

    widget.onSelectedAnswer(selectedAnswer) ;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {

    final cureentQuestion = ques[currentQuestionIndex] ;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 63, 20, 103),
              Color.fromARGB(255, 137, 38, 212),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              cureentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 174, 133, 214),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...cureentQuestion.getShuffle().map((answer) {
              return AnswerButton(
                answertext: answer,
                ontap: () {
                  answerQuestion(answer);
                } 
                );
            })
          ],
        ),
      ),
    );
  }
}
