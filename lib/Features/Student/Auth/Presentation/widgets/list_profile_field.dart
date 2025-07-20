import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/routes/app_router.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Home/Presentation/Pages/home_page.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/widgets/profile_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListProfileField extends StatelessWidget {
  final ProfileState state;
  const ListProfileField({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileField(
          onTap: () {
            if (state is StudentProfileSuccess) {
              final model = (state as StudentProfileSuccess).model;
              GoRouter.of(
                context,
              ).push(AppRouter.studentPersonalInfo, extra: model);
            }
          },
          text: "معلوماتي الشخصية",
          iconData: Icons.person,
          color: Colors.green,

          isNeedArrow: true,
        ),
        SizedBox(height: 10),
        ProfileField(
          onTap: () {},
          text: "التقدم الأكاديمي",
          iconData: Icons.insights,
          color: AppColor.borderTextField,
          isNeedArrow: true,
        ),
        SizedBox(height: 10),
        ProfileField(
          onTap: () {},
          text: "كورساتي",
          iconData: Icons.request_page_outlined,
          color: AppColor.primaryColor,
          isNeedArrow: true,
        ),
        SizedBox(height: 10),
        BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is LogoutDone) {
              getit<TokenHandler>().clearToken();
              //  CacheHelper().removeData(key: "token");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          },
          child: ProfileField(
            onTap: () {
              showLogoutDialog(context, () {
                context.read<ProfileCubit>().logout();
              });
              // context.read<ProfileCubit>().logout();
              // state is LogoutDone ? CacheHelper().removeData(key: "token") : null;
            },
            text: "تسجيل الخروج",
            iconData: Icons.exit_to_app_rounded,
            color: AppColor.error,
            isNeedArrow: false,
          ),
        ),
      ],
    );
  }
}
