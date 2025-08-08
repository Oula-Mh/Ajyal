import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/choice_Item.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:flutter/material.dart';

class QuestionCardCurrent extends StatelessWidget {
  final QuestionCurrentModel main;
  final QuestionCurrentModel sub;
  final int timeLeft;
  final Function(int) onOptionSelected;

  const QuestionCardCurrent({
    super.key,
    required this.main,
    required this.sub,
    required this.timeLeft,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        color: const Color(0xFFECEFFA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (main.questionText.isNotEmpty) ...[
            Text(
              main.questionText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (main.image != null) ...[
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder:
                        (_) => Dialog(
                          child: InteractiveViewer(
                            child: Image.network(main.image!),
                          ),
                        ),
                  );
                },
                child: Image.network(
                  main.image!,
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          if (main.questionText.isNotEmpty && main.id != sub.id) ...[
            Divider(height: 30, thickness: 1.5, color: Colors.grey.shade300),
          ],
          if (sub.questionText.isNotEmpty && main.id != sub.id) ...[
            Text(
              sub.questionText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
          ],

          const SizedBox(height: 16),
          Column(
            children: List.generate(
              sub.choices.length,
              (i) => ChoiceItem(
                text: sub.choices[i].choiceText,
                isSelected: sub.userSelectedIndex == i,
                onTap: timeLeft > 0 ? () => onOptionSelected(i) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
