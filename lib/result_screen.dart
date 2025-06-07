// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:quiz/data/ques.dart';
// import 'package:quiz/question_summary.dart';


// class ResultScreen extends StatelessWidget {
//   const ResultScreen({super.key, required this.choosenAnswer}) ;

//   final List<String> choosenAnswer ;

//   List<Map<String, Object>> getSummary() {
//     final List<Map<String, Object>> summary = [] ;

//     for ( var i = 0; i < choosenAnswer.length; i++ ) {
//       summary.add({
//         'question_index' : i,
//         'question' : ques[i].text,
//         'correct_answer' : ques[i].answer[0],
//         'user_answer' :  choosenAnswer[i],
//       }) ;
//     }

//     return summary ;
//   }

//   @override
//   Widget build(BuildContext context) {

//     final summarydata = getSummary();
//     final totalQuestions = ques.length ;
//     final totalAnsweredQuestion = summarydata.where((data) {
//       return data['user_answer'] == data['correct_answer'];
//     }).length;
//     return SizedBox(
//       width: double.infinity,
//       child: Container(
//         padding: const EdgeInsets.all(40),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 63, 20, 103),
//               Color.fromARGB(255, 137, 38, 212),
//             ],
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('you have answered $totalAnsweredQuestion out of $totalQuestions questions...'),
//             SizedBox(height: 30,),
//             QuestionSummary(getSummary()
//             ),
//             SizedBox(height: 30,),
//             TextButton(
//               onPressed: () {}, 
//               child: Text('Retry Quiz'))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quiz/data/ques.dart';
import 'package:quiz/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer, required this.onRestart});

  final List<String> choosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': ques[i].text,
        'correct_answer': ques[i].answer[0],
        'user_answer': choosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final totalQuestions = ques.length;
    final totalCorrect = summaryData.where((data) => data['user_answer'] == data['correct_answer']).length;

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
          children: [
            RichText(
              text: TextSpan(
                text: 'You answered ',
                style: const TextStyle(fontSize: 20, color: Colors.white),
                children: [
                  WidgetSpan(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('$totalCorrect', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const TextSpan(text: ' out of '),
                  WidgetSpan(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('$totalQuestions', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const TextSpan(text: ' questions correctly.'),
                ],
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text('Restart Quiz', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
