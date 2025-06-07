// import 'package:flutter/material.dart';

// class QuestionSummary extends StatelessWidget {
//   const QuestionSummary(this.summaryData, {super.key}) ;
// // class QuestionSummary extends StatelessWidget {
// //   QuestionSummary({super.key, required this.summaryData});

//   final List<Map<String, Object>> summaryData ;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//         child: SingleChildScrollView(
//           child: Column(
//           children: summaryData.map(
//             (data) {
//               return Row(children: [
//                 Text(((data['question_index'] as int) + 1).toString()),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       Text(data['question'] as String),
//                       SizedBox(height: 5,),
//                       Text(data['user_answer'] as String),
//                       Text(data['correct_answer'] as String),
//                     ],),
//                 )
//               ],);
//             },
//           ).toList(),
//                 ),
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['user_answer'] == data['correct_answer'];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Number Badge
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.lightBlueAccent : Colors.redAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Question and answers
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Your answer: ${data['user_answer']}',
                          style: TextStyle(
                            color: isCorrect ? Colors.lightBlueAccent : Colors.redAccent,
                          ),
                        ),
                        Text(
                          'Correct answer: ${data['correct_answer']}',
                          style: const TextStyle(
                            color: Colors.greenAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


