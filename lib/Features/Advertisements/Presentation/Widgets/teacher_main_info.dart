import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TeacherMainInfo extends StatelessWidget {
  const TeacherMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      right: 20,
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is TeacherProfileSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.model.name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 8),
                        blurRadius: 6,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone, color: AppColor.white1),
                    SizedBox(width: 10),
                    Text(
                      state.model.phoneNumber!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 3),
                            blurRadius: 6,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            // ✅ Shimmer عند التحميل
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 28, width: 150, color: Colors.white),
                  SizedBox(height: 10),
                  Container(height: 20, width: 120, color: Colors.white),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
