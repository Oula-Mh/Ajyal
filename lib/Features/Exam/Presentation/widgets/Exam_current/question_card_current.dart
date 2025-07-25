import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/question_current_model.dart';
import 'package:flutter/material.dart';

class QuestionCardCurrent extends StatelessWidget {
  final FullQuestionCurrent main;
  final SubQuestionCurrent sub;
  final int timeLeft;
  final Function(int) onOptionSelected;

  const QuestionCardCurrent({super.key, 
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
          if (main.mainText != null) ...[
            Text(
              main.mainText!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (main.imageUrl != null) ...[
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: InteractiveViewer(
                      child: Image.asset(main.imageUrl!),
                    ),
                  ),
                ),
                child: Image.asset(
                  main.imageUrl!,
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          if (main.mainText != null)
            Divider(height: 30, thickness: 1.5, color: Colors.grey.shade300),
          Text(
            sub.questionText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: List.generate(sub.options.length, (i) {
              final selected = sub.userSelectedIndex == i;
              return InkWell(
                onTap: timeLeft > 0 ? () => onOptionSelected(i) : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected ? Colors.blue : Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: selected
                        ? const Color.fromARGB(255, 100, 179, 244)
                            .withOpacity(0.2)
                        : Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: selected ? Colors.blue : Colors.grey,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          sub.options[i],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
