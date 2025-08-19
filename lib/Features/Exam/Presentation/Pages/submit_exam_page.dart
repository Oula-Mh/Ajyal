import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Exam/Presentation/Bloc/submit_exam/submit_exam_cubit.dart';
import 'package:ajyal/Features/Exam/Presentation/widgets/Exam_current/result.dart';
import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SubmitExamPage extends StatefulWidget {
  final ExamCurrentDetailsModel model;

  const SubmitExamPage({super.key, required this.model});

  @override
  State<SubmitExamPage> createState() => _SubmitExamPageState();
}

class _SubmitExamPageState extends State<SubmitExamPage> {
  int? _resultMessage;
  String? _errorMessage;
  bool _animationFinishedOnce = false;
  bool _animationLooping = false;

  @override
  void initState() {
    super.initState();
    context.read<SubmitExamCubit>().submitExam(widget.model);
  }

  void _updateResult({int? result, String? error}) {
    _resultMessage = result;
    _errorMessage = error;
    if (_animationFinishedOnce) setState(() {});
  }

  Future<bool> _onWillPop() async {
    GoRouter.of(context).go(AppRouter.homePage, extra: 3);

    return false; // منع الرجوع الافتراضي (إلغاء pop)
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // منع الرجوع التقليدي وتوجيه لصفحة محددة
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: BlocListener<SubmitExamCubit, SubmitExamState>(
          listener: (context, state) {
            if (state is SubmitExamSuccess) {
              _updateResult(result: state.message);
            } else if (state is SubmitExamFailure) {
              _updateResult(error: state.errMessage);
            }
          },
          child:
              (_animationFinishedOnce &&
                      (_resultMessage != null || _errorMessage != null))
                  ? (_resultMessage != null
                      ? _buildResult(context, _resultMessage!)
                      : _buildError(context, _errorMessage!))
                  : _buildLoading(context),
        ),
      ),
    );
  }

  Widget _buildLoading(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lottie/loading.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
            repeat: _animationLooping,
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                setState(() {
                  _animationFinishedOnce = true;
                  if (_resultMessage == null && _errorMessage == null) {
                    _animationLooping = true;
                  }
                });
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            "جارٍ حساب نتيجتك...",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "يرجى الانتظار قليلًا ريثما يتم حساب نتيجتك.\nويمكنك دائمًا العودة لاحقًا لرؤية نتيجتك من صفحة الاختبارات السابقة.",
            style: TextStyle(fontSize: 16, color: Colors.white60),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: () {
              GoRouter.of(context).go(AppRouter.homePage, extra: 3);
            },
            child: const Text(
              "أرغب بعدم الإنتظار   🙄",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildResult(BuildContext context, int result) =>
      ResultScreen(result: result);
  Widget _buildError(BuildContext context, String error) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error, size: 60, color: Colors.red),
        const SizedBox(height: 10),
        Text(
          error,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed:
              () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: const Text("الرجوع"),
        ),
      ],
    ),
  );
}
