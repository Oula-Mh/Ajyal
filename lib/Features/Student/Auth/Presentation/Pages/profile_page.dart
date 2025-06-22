import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/list_profile_field.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/qrcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white1,
        centerTitle: true,
        title: Text(
          "ملف الطالب",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return ListView(
              children: [
                QrCodeWidget(state: state),
                SizedBox(height: 40),
                ListProfileField(state: context.read<ProfileCubit>().state),
              ],
            );
          },
        ),
      ),
    );
  }
}
