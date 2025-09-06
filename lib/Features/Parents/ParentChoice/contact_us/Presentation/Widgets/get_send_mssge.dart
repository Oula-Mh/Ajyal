import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Features/Parents/ParentChoice/contact_us/Presentation/Bloc/contact_us/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAndSendMessage extends StatelessWidget {
  final ContactUsCubit cubit;
  const GetAndSendMessage({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
      buildWhen:
          (previous, current) =>
              current is ContactUsMessageLoading ||
              current is ContactUsMessageSuccess ||
              current is ContactUsMessageFail,
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
                    hintStyle: const TextStyle(color: Colors.grey),
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
                  onPressed:
                      state is ContactUsMessageLoading
                          ? null // إيقاف الزر أثناء التحميل
                          : () {
                            cubit.sendMessage();
                          },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state is ContactUsMessageLoading)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      else
                        Transform.flip(
                          flipX: true,
                          child: Icon(Icons.send, color: AppColor.white1),
                        ),
                      const SizedBox(width: 15),
                      Text(
                        state is ContactUsMessageLoading
                            ? "جارٍ الإرسال..."
                            : "إرسال",
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.white1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (state is ContactUsMessageFail)
              Text(state.errMessage, style: const TextStyle(color: Colors.red)),
            if (state is ContactUsMessageSuccess)
              const Text(
                "تم إرسال الرسالة بنجاح",
                style: TextStyle(color: Colors.green),
              ),
          ],
        );
      },
    );
  }
}
