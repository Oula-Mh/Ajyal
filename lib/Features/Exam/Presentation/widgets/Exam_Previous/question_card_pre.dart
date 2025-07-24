import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/options_list_pre.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/question_pre_model.dart';
import 'package:flutter/material.dart';

class QuestionCardPre extends StatelessWidget {
  final FullQuestionPre mainQuestion;
  final SubQuestionPre subQuestion;

  const QuestionCardPre({
    super.key,
    required this.mainQuestion,
    required this.subQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 242, 250),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mainQuestion.mainText != null) ...[
                Text(
                  mainQuestion.mainText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              if (mainQuestion.imageUrl != null) ...[
                const SizedBox(height: 12),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (_) => Dialog(
                              child: InteractiveViewer(
                                child: Image.asset(mainQuestion.imageUrl!),
                              ),
                            ),
                      );
                    },
                    child: Image.asset(
                      mainQuestion.imageUrl!,
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
              if (mainQuestion.mainText != null) ...[
                Divider(
                  height: 30,
                  thickness: 1.5,
                  color: Colors.grey.shade300,
                ),
              ],
              Text(
                subQuestion.questionText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 16),
              OptionsListPre(subQuestion: subQuestion),
              const SizedBox(height: 20),
              if (subQuestion.hint != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 246, 223),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.orange, size: 26),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          subQuestion.hint!,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
