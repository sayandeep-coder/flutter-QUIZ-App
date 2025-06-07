import 'package:flutter/material.dart';
import 'package:quiz/colours.dart';
import 'package:quiz/question.dart';
import 'package:quiz/data/ques.dart';
import 'package:quiz/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
  
  List<String> selectedAnswer = [] ;
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer) ;

    if (selectedAnswer.length == ques.length) {
      setState(() {
        // selectedAnswer = [] ;
        activeScreen = 'result-screen' ;
      });
    }
  }

  @override

  Widget build(BuildContext context) {

    Widget screenWidget = ColorQuiz(switchScreen);
  
    if ( activeScreen == 'question-screen' ) {
      screenWidget = QuizQuestions(onSelectedAnswer : chooseAnswer);
    }

    // if (activeScreen == 'result-screen') {
    //   screenWidget = ResultScreen(choosenAnswer: selectedAnswer,);
    // }
    if (activeScreen == 'result-screen') {
  screenWidget = ResultScreen(
    choosenAnswer: selectedAnswer,
    onRestart: () {
      setState(() {
        selectedAnswer = [];
        activeScreen = 'start-screen';
      });
    },
  );
}

    
    return MaterialApp(
      home: Scaffold(
        body:  screenWidget,
        // activeScreen == 'start-screen' 
        // ? ColorQuiz(switchScreen)
        // : const QuizQuestions(),
      ),
    );
  }
}
