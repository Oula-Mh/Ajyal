import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommunityQuestionPage extends StatelessWidget {
  const CommunityQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.myQuestionPage);
          },
          child: Text("my questions"),
        ),
      ),
    );
  }
}
