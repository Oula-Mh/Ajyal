import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Bloc/contact_us/contact_us_cubit.dart';
import 'package:flutter/material.dart';

class GetAndSendMessage extends StatelessWidget {
  final ContactUsCubit cubit;
  const GetAndSendMessage({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 246, 247),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              maxLines: 6,
              controller: cubit.messageController,
              decoration: InputDecoration(
                hintText: "أدخل رسالتك هنا ... ",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColor.primaryColor),
                ),
              ),
              onPressed: () {
                cubit.printsS();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.flip(
                    flipX: true, // يعكس الأيقونة أفقياً
                    child: Icon(Icons.send, color: AppColor.white1),
                  ),
                  SizedBox(width: 15),
                  const Text(
                    "إرسال",
                    style: TextStyle(fontSize: 16, color: AppColor.white1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
