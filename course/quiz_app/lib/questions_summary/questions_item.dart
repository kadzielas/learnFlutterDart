import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/questions_identifier.dart';

class QuestionsItem extends StatelessWidget {
  const QuestionsItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Row(
        //index is on the same height like question
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionsIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            //parse object string into int
            //tryparse is more safer because as it returns null if the conversion fails
            questionIndex: int.tryParse(itemData['question'] as String) ?? 0,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemData['question'] as String,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    itemData['user_answer'] as String,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(154, 255, 255, 255),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    itemData['correct_answer'] as String,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 61, 222, 67),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
