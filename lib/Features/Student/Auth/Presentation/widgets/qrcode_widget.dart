import 'dart:ui';

import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Student/Auth/Presentation/Bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class QrCodeWidget extends StatelessWidget {
  final ProfileState state;
  const QrCodeWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFA2E3F5),
              AppColor.primaryColor,
              AppColor.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildQRCodeContent(state),
          ),
        ),
      ),
    );
    // child: QrImageView(
    //   data: (state as ProfileSuccess).model.data!.studentId!,
    //   version: QrVersions.auto,
    //   size: 220.0,
    //   backgroundColor: Colors.white,
    // ),
    //           )
    //           : state is ProfileLoading
    // ? Shimmer.fromColors(
    //   baseColor: Colors.grey[300]!,
    //   highlightColor: AppColor.secondaryColor.withAlpha(100),
    //   child: Container(
    //     width: 200.0,
    //     height: 200.0,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //   ),
    // )
    //           : Text("فشل"),
    // ),
  }

  Widget _buildQRCodeContent(ProfileState state) {
    if (state is ProfileSuccess) {
      return QrImageView(
        data: state.model.data!.studentId!,
        version: QrVersions.auto,
        size: 200.0,
        backgroundColor: Colors.white,
      );
    } else if (state is ProfileLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: AppColor.secondaryColor.withOpacity(0.2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.white,
            child: Stack(
              children: [
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: Container(color: Colors.white.withOpacity(0.1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Text("لا يوجد اتصال بالشبكة");
    }
  }
}
