import 'package:ajyal/Core/styles/app_text_style.dart';
import 'package:ajyal/Custom/Custom_widgets/auth/custom_text_field.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/register/register_cubit.dart';
import 'package:flutter/material.dart';

class PassWordForm extends StatelessWidget {
  final RegisterCubit cubit;
  const PassWordForm({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("كلمة المرور : ", style: Styles.meduimBlack),
        SizedBox(height: 8),
        CustomTextField(
          isPassword: true,
          passToggle: true,
          controller: cubit.passWordController,
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
        ),
        SizedBox(height: 31),
        Text("تأكيد كلمة المرور : ", style: Styles.meduimBlack),
        SizedBox(height: 8),
        CustomTextField(
          isPassword: true,
          passToggle: true,
          controller: cubit.rePassWordController,
          keyboardType: TextInputType.text,
          icon: Icons.lock_outline,
        ),
      ],
    );
  }
}
