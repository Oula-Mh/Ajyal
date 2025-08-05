import 'package:ajyal/Custom/Custom_widgets/auth/custom_container_auth.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_header_auth.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

import '../../../../../Custom/Custom_ui.dart/gradient_background_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GradientBackgroundWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeaderAuth(text: "تسجيل الدخول"),
              CustomContainerAuth(
                child: SingleChildScrollView(child: LoginFormStudent()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
