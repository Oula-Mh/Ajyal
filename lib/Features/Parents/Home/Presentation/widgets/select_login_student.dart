import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/bloc/StudentLink/student_link_cubit.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/single_student_item.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/student_check_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectStudentLogin extends StatelessWidget {
  const SelectStudentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اختيار طالب", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.primaryColor,
      ),
      body: BlocBuilder<StudentLinkCubit, StudentLinkState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 22,
                ),
                child: Text(
                  "يمكنك متابعة أداء جميع ابناءك بسهولة عن طريق تطبيقنا في معهد أجيال",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    height: 1.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "* اضغط اختيار طالب للاختيار ",
                  style: TextStyle(color: AppColor.borderTextField),
                ),
              ),
              SizedBox(height: 20),
              state is LoadingState
                  ? Center(child: CircularProgressIndicator())
                  : state is AllParentStuentLoaded
                  ? StudentCheckList(students: state.listModel)
                  : state is FailState
                  ? Center(child: Text(state.errMessage))
                  : Center(child: Text("حدث خطأ ما !!")),
            ],
          );
        },
      ),
    );
  }
}
