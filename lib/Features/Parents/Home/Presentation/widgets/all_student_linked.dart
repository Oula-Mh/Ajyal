import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Custom/Custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllStudentLinked extends StatelessWidget {
  const AllStudentLinked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "جميع الطلاب"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 22),
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
              "* يمكنك التبديل بين الطلاب عن طريق مسح الرمز",
              style: TextStyle(color: AppColor.borderTextField),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.secondaryColor,
                            width: 2,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          "الطالب ${index + 1} : سارة النجار النعال",
                          style: TextStyle(
                            height: 1.5,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        subtitle: Text(
                          "الصف : بكالوريا",
                          style: TextStyle(
                            height: 2,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.qr_code,
                              color: AppColor.primaryColor,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
