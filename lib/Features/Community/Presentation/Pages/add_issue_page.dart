import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Community/Presentation/Bloc/issue_list_cubit/issue_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddIssuePage extends StatelessWidget {
  final int curriculum_id;
  const AddIssuePage({super.key, required this.curriculum_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: BlocConsumer<IssueListCubit, IssueListState>(
          listener: (context, state) {
            if (state is IssueListFailure) {
              customAlert(context, state.errMessage, () {
                Navigator.of(context).pop();
              });
            } else if (state is AddIssueDone) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              GoRouter.of(context).pop();
            }
          },
          builder: (context, state) {
            final cubit = IssueListCubit.get(context);
            return Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  "يمكنك إضافة سؤال هنا",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                // اسم الشخص وعبارة الترحيب
                // ParentNameWidget(state: state),
                const SizedBox(height: 24),

                // حقل إدخال الرسالة
                AddIssueWidget(id: curriculum_id, cubit: cubit, state: state),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AddIssueWidget extends StatelessWidget {
  final IssueListCubit cubit;
  final IssueListState state;
  final int id;
  const AddIssueWidget({
    super.key,
    required this.cubit,
    required this.id,
    required this.state,
  });

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
              controller: cubit.issueController,
              decoration: InputDecoration(
                hintText: "أدخل رسالتك هنا ... ",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
        state is IssueListLoading
            ? CircularProgressIndicator()
            : Padding(
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
                    cubit.addIssue(id, cubit.issueController.text);
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
