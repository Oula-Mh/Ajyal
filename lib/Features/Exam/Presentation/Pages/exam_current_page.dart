import 'dart:async';

import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/arrow_next_pre.dart';

class FullQuestions {
  final String? mainText;
  final String? imageUrl;
  final List<SubQuestions> subQuestions;

  FullQuestions({
    required this.mainText,
    this.imageUrl,
    required this.subQuestions,
  });
}

class SubQuestions {
  final String questionText;
  final List<String> options;
  int userSelectedIndex;

  SubQuestions({
    required this.questionText,
    required this.options,
    this.userSelectedIndex = -1,
  });
}

class ExamCurrentPage extends StatefulWidget {
  final int totalTime;
  final int initialTime;

  ExamCurrentPage({
    Key? key,
    required this.totalTime,
    required this.initialTime,
  }) : super(key: key);

  @override
  _ExamCurrentPageState createState() => _ExamCurrentPageState();
}

class _ExamCurrentPageState extends State<ExamCurrentPage>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Timer? timer;
  late int totalTime;
  late int timeLeft;

  late AnimationController _controller;

  final List<FullQuestions> questions = [
    FullQuestions(
      mainText: "راقب الرسم البياني التالي ثم أجب على الأسئلة.",
      imageUrl: "assets/images/exam.jfif",
      subQuestions: [
        SubQuestions(
          questionText: "ما القيمة التي يمثلها العمود الأحمر؟",
          options: ["٢٠", "٤٠", "٦٠", "٨٠"],
        ),
        SubQuestions(
          questionText: "أي لون يمثل أعلى قيمة؟",
          options: ["الأحمر", "الأزرق", "الأخضر", "الأصفر"],
        ),
      ],
    ),
    FullQuestions(
      mainText: "اختر الكلمة الصحيحة التي تناسب التعريف التالي:",
      subQuestions: [
        SubQuestions(
          questionText: "ما معنى 'التمثيل الضوئي'؟",
          options: [
            "نوع من انقسام الخلايا",
            "عملية إنتاج الغذاء باستخدام ضوء الشمس",
            "قياس شدة الضوء",
            "لا شيء مما سبق",
          ],
        ),
        SubQuestions(
          questionText: "اختر التعريف الصحيح لـ 'التبخر'.",
          options: [
            "تحول الماء إلى بخار",
            "زيادة في كمية الأمطار",
            "ذوبان المادة الصلبة إلى سائل",
            "لا شيء مما سبق",
          ],
        ),
      ],
    ),
    FullQuestions(
      mainText: null,
      subQuestions: [
        SubQuestions(
          questionText: "ما هو لون علم فرنسا؟",
          options: [
            "أحمر وأخضر",
            "أزرق وأبيض وأحمر",
            "أسود وأصفر",
            "أزرق وأصفر",
          ],
        ),
      ],
    ),
  ];

  late final List<Map<String, dynamic>> allSubQuestions;

  @override
  void initState() {
    super.initState();

    allSubQuestions = <Map<String, dynamic>>[];
    for (var fq in questions) {
      for (var sq in fq.subQuestions) {
        allSubQuestions.add({"main": fq, "sub": sq});
      }
    }

    totalTime = widget.totalTime;
    timeLeft = widget.initialTime.clamp(0, totalTime);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: totalTime),
    )..forward(from: 1 - timeLeft / totalTime);

    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
        showTimeUpDialog();
      }
    });
  }

  void showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text("انتهى الوقت"),
            content: Text("انتهى الوقت المخصص للاختبار."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("حسناً"),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  Color getTimerColor() {
    if (timeLeft <= 30) return Colors.red;
    if (timeLeft <= 60) return Colors.orange;
    return Color.fromARGB(255, 184, 138, 168);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                right: 25,
                left: 25,
                top: 25,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (_) => AlertDialog(
                                  title: Text("إنهاء الاختبار"),
                                  content: Text(
                                    "هل أنت متأكد أنك تريد إنهاء الاختبار؟",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("إلغاء"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("نعم"),
                                    ),
                                  ],
                                ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: Text(
                          "إنهاء الاختبار",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          //  Icon(Icons.timer_outlined, color: getTimerColor()),
                          const SizedBox(width: 6),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 55,
                                height: 55,
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) {
                                    return CircularProgressIndicator(
                                      value: 1 - _controller.value,
                                      strokeWidth: 9,
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        getTimerColor(),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              Text(
                                formatTime(timeLeft),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: getTimerColor(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "اختبار بحث المتتاليات",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1.2),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: allSubQuestions.length,
                itemBuilder: (context, index) {
                  final main = allSubQuestions[index]["main"] as FullQuestions;
                  final sub = allSubQuestions[index]["sub"] as SubQuestions;

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 35,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 242, 250),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (main.mainText != null) ...[
                            Text(
                              main.mainText!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                          if (main.imageUrl != null) ...[
                            SizedBox(height: 12),
                            Center(
                              child: GestureDetector(
                                onTap:
                                    () => showDialog(
                                      context: context,
                                      builder:
                                          (_) => Dialog(
                                            child: InteractiveViewer(
                                              child: Image.asset(
                                                main.imageUrl!,
                                              ),
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
                            Divider(
                              height: 30,
                              thickness: 1.5,
                              color: Colors.grey.shade300,
                            ),
                          Text(
                            sub.questionText,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            children: List.generate(sub.options.length, (i) {
                              return InkWell(
                                onTap:
                                    timeLeft > 0
                                        ? () => setState(
                                          () => sub.userSelectedIndex = i,
                                        )
                                        : null,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          sub.userSelectedIndex == i
                                              ? Colors.blue
                                              : Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        sub.userSelectedIndex == i
                                            ? const Color.fromARGB(
                                              255,
                                              100,
                                              179,
                                              244,
                                            ).withOpacity(0.2)
                                            : Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        sub.userSelectedIndex == i
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_unchecked,
                                        color:
                                            sub.userSelectedIndex == i
                                                ? Colors.blue
                                                : Colors.grey,
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowNextPre(
              onTap:
                  _currentPage > 0
                      ? () => _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                      : null,
              color:
                  _currentPage > 0 ? AppColor.primaryColor : Color(0xFFCDCCCC),
              icon: Icons.arrow_back_ios,
            ),

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
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
                              const Text(
                                "جميع الأسئلة",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "يمكنك التنقل بين الأسئلة",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Expanded(
                                child: GridView.builder(
                                  itemCount: allSubQuestions.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5,
                                        crossAxisSpacing: 11,
                                        mainAxisSpacing: 11,
                                      ),
                                  itemBuilder: (context, index) {
                                    final sub =
                                        allSubQuestions[index]["sub"]
                                            as SubQuestions;
                                    final bool isCurrent =
                                        index == _currentPage;
                                    final bool isAnswered =
                                        sub.userSelectedIndex != -1;

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        _pageController.jumpToPage(index);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color:
                                                isCurrent
                                                    ? AppColor.primaryColor
                                                    : isAnswered
                                                    ? AppColor.primaryColor
                                                    : Colors.grey.shade300,
                                            width: 2.5,
                                          ),
                                          color:
                                              isCurrent
                                                  ? AppColor.primaryColor
                                                  : Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color:
                                                isCurrent
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
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: AppColor.primaryColor),
                ),
                child: Text(
                  "السؤال ${_currentPage + 1} من ${allSubQuestions.length}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ArrowNextPre(
              onTap:
                  _currentPage < allSubQuestions.length - 1
                      ? () => _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut,
                      )
                      : null,
              color:
                  _currentPage < allSubQuestions.length - 1
                      ? AppColor.primaryColor
                      : Color(0xFFCDCCCC),
              icon: Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
