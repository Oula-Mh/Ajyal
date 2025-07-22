import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircularTeacherImage extends StatelessWidget {
  final double containerHeight;
  const CircularTeacherImage({super.key, required this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: containerHeight - 205,
      left: 28,
      child: Container(
        padding: const EdgeInsets.all(6), // الإطار الأول
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(6), // الإطار الثاني
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.secondaryColor,
          ),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return state is TeacherProfileSuccess
                  ? state.model.image != null
                      ? CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          EndPoints.fileBaseUrl + state.model.image!.path!,
                        ),
                      )
                      : CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 60,
                        child: Icon(
                          Icons.co_present_outlined,
                          color: Colors.grey,
                        ),
                      )
                  : CircleAvatar(
                    radius: 60,
                    child: Icon(Icons.co_present_outlined),
                  );
            },
          ),
        ),
      ),
    );
  }
}
