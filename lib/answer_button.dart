import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  // AnswerButton(this.answertext, this.ontap,{super.key}) ;
  AnswerButton({super.key,required this.answertext,required this.ontap,}) ;
  final String answertext ;
  final void Function () ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10
              ),
            backgroundColor: const Color.fromARGB(255, 1, 27, 71),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)) ,
          ),
            child: Text(answertext, textAlign: TextAlign.center, ),
    ); 
  }
}