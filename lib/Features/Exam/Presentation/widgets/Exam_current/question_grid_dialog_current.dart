import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/question_current_model.dart';
import 'package:flutter/material.dart';


class QuestionGridDialogCurrent extends StatelessWidget {
  final List<Map<String, dynamic>> allSubQuestions;
  final int currentPage;
  final PageController pageController;

  const QuestionGridDialogCurrent({super.key, 
    required this.allSubQuestions,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white1,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("جميع الأسئلة",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text("يمكنك التنقل بين الأسئلة",
                  style: TextStyle(fontSize: 16, color: Colors.black54)),
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
                    final sub = allSubQuestions[index]['sub'] as SubQuestionCurrent;
                    final bool isCurrent = index == currentPage;
                    final bool isAnswered = sub.userSelectedIndex != -1;
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        pageController.jumpToPage(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isCurrent
                                ? AppColor.primaryColor
                                : isAnswered
                                    ? AppColor.primaryColor
                                    : Colors.grey.shade300,
                            width: 2.5,
                          ),
                          color:
                              isCurrent ? AppColor.primaryColor : Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: isCurrent
                                ? Colors.white
                                : isAnswered
                                    ? Colors.black87
                                    : Colors.black54,
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
