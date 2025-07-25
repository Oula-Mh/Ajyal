import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/question_pre_model.dart';
import 'package:flutter/material.dart';

class QuestionGridDialogPre extends StatelessWidget {
  final List<Map<String, dynamic>> allSubQuestions;
  final int currentIndex;
  final Function(int) onSelect;

  const QuestionGridDialogPre({
    super.key,
    required this.allSubQuestions,
    required this.currentIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white1,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                "جميع الأسئلة",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "يمكنك التنقل بين الأسئلة",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  itemCount: allSubQuestions.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 11,
                    mainAxisSpacing: 11,
                  ),
                  itemBuilder: (context, index) {
                    final subQ =
                        allSubQuestions[index]["sub"] as SubQuestionPre;
                    Color borderColor = Colors.grey;
                    Color textColor = Colors.black;

                    if (subQ.userSelectedIndex == subQ.correctAnswerIndex) {
                      borderColor = Colors.green;
                      textColor = Colors.green.shade900;
                    } else if (subQ.userSelectedIndex !=
                            subQ.correctAnswerIndex &&
                        subQ.userSelectedIndex != -1) {
                      borderColor = Colors.red;
                      textColor = Colors.red.shade900;
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        onSelect(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: borderColor, width: 2),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
