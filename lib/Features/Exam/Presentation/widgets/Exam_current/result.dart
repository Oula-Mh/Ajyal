import 'dart:ui';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatefulWidget {
  final int result;

  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  String _getMotivationalMessage(int score) {
    if (score >= 90) return "🎉 ممتاز! أنت نجم!";
    if (score >= 75) return "🌟 أداء رائع!";
    if (score >= 50) return "👍 جيد، تابع التقدم!";
    return "لا بأس، القادم أجمل!\nما فاتك لا يعني أنك فشلت، بل يعني أن الفرصة ما زالت بيدك لتتقدم.";
  }

  // Color _getScoreColor(int score) {
  //   if (score >= 90) return Colors.green;
  //   if (score >= 75) return Colors.blue;
  //   if (score >= 50) return Colors.orange;
  //   return const Color.fromARGB(255, 246, 89, 77);
  // }
  Color _getScoreColor(int score) {
    if (score >= 17) return Colors.green;
    if (score >= 15) return Colors.blue;
    if (score >= 8) return Colors.orange;
    return const Color.fromARGB(255, 246, 89, 77);
  }

  @override
  Widget build(BuildContext context) {
    final int result = widget.result;
    final double percent = result / 100;
    final Color scoreColor = _getScoreColor(result);
    final String message = _getMotivationalMessage(result);

    return Scaffold(
      body: Stack(
        children: [
          // 💫 خلفية بلورية متدرجة ناعمة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [scoreColor.withOpacity(0.15), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(color: Colors.transparent),
            ),
          ),

          // ✨ مؤثر النجوم في الأعلى
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.asset(
              'assets/lottie/congratulations.json',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              repeat: true,
            ),
          ),

          // 🧩 المحتوى الرئيسي
          FadeTransition(
            opacity: _fadeController,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🎯 عنوان الصفحة
                    Text(
                      "نتيجتك",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: scoreColor,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 🔵 Container لعرض النتيجة
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: scoreColor.withOpacity(0.09),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: scoreColor.withOpacity(0.15),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 16.0,
                                animation: true,
                                animationDuration: 1200,
                                percent: percent.clamp(0.0, 1.0),
                                center: Text(
                                  "$result%",
                                  style: TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.bold,
                                    color: scoreColor,
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: scoreColor,
                                backgroundColor: Colors.grey.shade200,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // 📝 كرت النص التحفيزي خارج الـ container
                    Card(
                      color: scoreColor.withOpacity(0.1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: scoreColor,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),

          // 🔘 زر العودة بأسفل الشاشة
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.homePage, extra: 3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                  ),
                  child: const Text(
                    "حسناً، العودة للصفحة الرئيسية",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
