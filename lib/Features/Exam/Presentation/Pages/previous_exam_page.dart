import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/question_card_pre.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_Previous/question_pre_model.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/exam_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/Exam_Previous/question_grid_dialog_pre.dart';

class PreviousExamPage extends StatefulWidget {
  const PreviousExamPage({super.key});

  @override
  State<PreviousExamPage> createState() => _PreviousExamPageState();
}

class _PreviousExamPageState extends State<PreviousExamPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late final List<FullQuestionPre> questions;
  late final List<Map<String, dynamic>> allSubQuestions;

  @override
  void initState() {
    super.initState();
    questions = _loadQuestions();
    allSubQuestions = <Map<String, dynamic>>[];
    for (var fq in questions) {
      for (var sq in fq.subQuestions) {
        allSubQuestions.add({"main": fq, "sub": sq});
      }
    }
  }

  List<FullQuestionPre> _loadQuestions() {
    // هنا يمكنك تحميل البيانات من API لاحقاً
    return [
      FullQuestionPre(
        mainText: "راقب الرسم البياني التالي ثم أجب على الأسئلة.",
        imageUrl: "assets/images/exam.jfif",
        subQuestions: [
          SubQuestionPre(
            questionText: "ما القيمة التي يمثلها العمود الأحمر؟",
            options: ["٢٠", "٤٠", "٦٠", "٨٠"],
            correctAnswerIndex: 2,
            userSelectedIndex: 1,
            hint: "احسب عدد الوحدات التي يغطيها العمود الأحمر.",
          ),
          SubQuestionPre(
            questionText: "أي لون يمثل أعلى قيمة؟",
            options: ["الأحمر", "الأزرق", "الأخضر", "الأصفر"],
            correctAnswerIndex: 1,
            userSelectedIndex: 1,
            hint: "انظر إلى ارتفاع كل عمود.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: "اختر الكلمة الصحيحة التي تناسب التعريف التالي:",
        subQuestions: [
          SubQuestionPre(
            questionText: "ما معنى 'التمثيل الضوئي'؟",
            options: [
              "نوع من انقسام الخلايا",
              "عملية إنتاج الغذاء باستخدام ضوء الشمس",
              "قياس شدة الضوء",
              "لا شيء مما سبق",
            ],
            correctAnswerIndex: 1,
            userSelectedIndex: 0,
            hint: "فكر كيف تصنع النباتات غذاءها.",
          ),
          SubQuestionPre(
            questionText: "اختر التعريف الصحيح لـ 'التبخر'.",
            options: [
              "تحول الماء إلى بخار",
              "زيادة في كمية الأمطار",
              "ذوبان المادة الصلبة إلى سائل",
              "لا شيء مما سبق",
            ],
            correctAnswerIndex: 0,
            userSelectedIndex: 0,
            hint: "يحدث عند تسخين الماء.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: null,
        subQuestions: [
          SubQuestionPre(
            questionText: "ما هو لون علم فرنسا؟",
            options: [
              "أحمر وأخضر",
              "أزرق وأبيض وأحمر",
              "أسود وأصفر",
              "أزرق وأصفر",
            ],
            correctAnswerIndex: 1,
            userSelectedIndex: 0,
            hint: "يتكون من ٣ ألوان رأسية.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: "راقب الرسم البياني التالي ثم أجب على الأسئلة.",
        imageUrl: "assets/images/exam.jfif",
        subQuestions: [
          SubQuestionPre(
            questionText: "ما القيمة التي يمثلها العمود الأحمر؟",
            options: ["٢٠", "٤٠", "٦٠", "٨٠"],
            correctAnswerIndex: 2,
            userSelectedIndex: 1,
            hint: "احسب عدد الوحدات التي يغطيها العمود الأحمر.",
          ),
          SubQuestionPre(
            questionText: "أي لون يمثل أعلى قيمة؟",
            options: ["الأحمر", "الأزرق", "الأخضر", "الأصفر"],
            correctAnswerIndex: 1,
            userSelectedIndex: 1,
            hint: "انظر إلى ارتفاع كل عمود.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: "اختر الكلمة الصحيحة التي تناسب التعريف التالي:",
        subQuestions: [
          SubQuestionPre(
            questionText: "ما معنى 'التمثيل الضوئي'؟",
            options: [
              "نوع من انقسام الخلايا",
              "عملية إنتاج الغذاء باستخدام ضوء الشمس",
              "قياس شدة الضوء",
              "لا شيء مما سبق",
            ],
            correctAnswerIndex: 1,
            userSelectedIndex: 0,
            hint: "فكر كيف تصنع النباتات غذاءها.",
          ),
          SubQuestionPre(
            questionText: "اختر التعريف الصحيح لـ 'التبخر'.",
            options: [
              "تحول الماء إلى بخار",
              "زيادة في كمية الأمطار",
              "ذوبان المادة الصلبة إلى سائل",
              "لا شيء مما سبق",
            ],
            correctAnswerIndex: 0,
            userSelectedIndex: 0,
            hint: "يحدث عند تسخين الماء.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: null,
        subQuestions: [
          SubQuestionPre(
            questionText: "ما هو لون علم فرنسا؟",
            options: [
              "أحمر وأخضر",
              "أزرق وأبيض وأحمر",
              "أسود وأصفر",
              "أزرق وأصفر",
            ],
            correctAnswerIndex: 1,
            userSelectedIndex: 0,
            hint: "يتكون من ٣ ألوان رأسية.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: "راقب الرسم البياني التالي ثم أجب على الأسئلة.",
        imageUrl: "assets/images/exam.jfif",
        subQuestions: [
          SubQuestionPre(
            questionText: "ما القيمة التي يمثلها العمود الأحمر؟",
            options: ["٢٠", "٤٠", "٦٠", "٨٠"],
            correctAnswerIndex: 2,
            userSelectedIndex: 1,
            hint: "احسب عدد الوحدات التي يغطيها العمود الأحمر.",
          ),
          SubQuestionPre(
            questionText: "أي لون يمثل أعلى قيمة؟",
            options: ["الأحمر", "الأزرق", "الأخضر", "الأصفر"],
            correctAnswerIndex: 1,
            userSelectedIndex: 1,
            hint: "انظر إلى ارتفاع كل عمود.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: null,
        subQuestions: [
          SubQuestionPre(
            questionText: "ما هو لون علم فرنسا؟",
            options: [
              "أحمر وأخضر",
              "أزرق وأبيض وأحمر",
              "أسود وأصفر",
              "أزرق وأصفر",
            ],
            correctAnswerIndex: 1,
            userSelectedIndex: 0,
            hint: "يتكون من ٣ ألوان رأسية.",
          ),
        ],
      ),
      FullQuestionPre(
        mainText: "اختر الكلمة الصحيحة التي تناسب التعريف التالي:",
        subQuestions: [
          SubQuestionPre(
            questionText: "ما معنى 'التمثيل الضوئي'؟",
            options: [
              "نوع من انقسام الخلايا",
              "عملية إنتاج الغذاء باستخدام ضوء الشمس",
              "قياس شدة الضوء",
              "لا شيء مما سبق",
            ],
            correctAnswerIndex: 1,
            userSelectedIndex: 0,
            hint: "فكر كيف تصنع النباتات غذاءها.",
          ),
          SubQuestionPre(
            questionText: "اختر التعريف الصحيح لـ 'التبخر'.",
            options: [
              "تحول الماء إلى بخار",
              "زيادة في كمية الأمطار",
              "ذوبان المادة الصلبة إلى سائل",
              "لا شيء مما سبق",
            ],
            correctAnswerIndex: 0,
            userSelectedIndex: 0,
            hint: "يحدث عند تسخين الماء.",
          ),
        ],
      ),
    ];
  }

  void _openQuestionGridDialog() {
    showDialog(
      context: context,
      builder:
          (context) => QuestionGridDialogPre(
            allSubQuestions: allSubQuestions,
            currentIndex: _currentPage,
            onSelect: (index) {
              setState(() {
                _currentPage = index;
                _pageController.jumpToPage(index);
              });
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("المتتاليات "),
        backgroundColor: Colors.white,
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemCount: allSubQuestions.length,
        itemBuilder: (context, index) {
          final mainQuestion =
              allSubQuestions[index]["main"] as FullQuestionPre;
          final subQuestion = allSubQuestions[index]["sub"] as SubQuestionPre;

          return Center(
            child: QuestionCardPre(
              mainQuestion: mainQuestion,
              subQuestion: subQuestion,
            ),
          );
        },
      ),
      bottomNavigationBar: ExamNavigationBar(
        currentPage: _currentPage,
        totalPages: allSubQuestions.length,
        onPrevious:
            _currentPage > 0
                ? () => _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                )
                : null,
        onNext:
            _currentPage < allSubQuestions.length - 1
                ? () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linearToEaseOut,
                )
                : null,
        onOpenGrid: _openQuestionGridDialog,
      ),
    );
  }
}
