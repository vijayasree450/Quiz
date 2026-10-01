import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            final isCorrect = item['user_answer'] == item['correct_answer'];
            final questionIndex = (item['question_index'] as int) + 1;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? const Color.fromARGB(255, 150, 198, 241)
                          : const Color.fromARGB(255, 249, 133, 241),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      questionIndex.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 22, 2, 56),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Your answer: ${item['user_answer']}',
                          style: TextStyle(
                            color: isCorrect
                                ? const Color.fromARGB(255, 180, 225, 255)
                                : const Color.fromARGB(255, 249, 140, 241),
                            fontSize: 13,
                          ),
                        ),
                        if (!isCorrect)
                          Text(
                            'Correct: ${item['correct_answer']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 181, 254, 246),
                              fontSize: 13,
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

