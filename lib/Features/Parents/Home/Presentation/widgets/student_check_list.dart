import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/routes/route_constant.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Parents/Home/Data/models/parent_student_model.dart';
import 'package:ajyal/Features/Parents/Home/Presentation/widgets/select_student_bttn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StudentCheckList extends StatefulWidget {
  final List<ParentStudentModel> students;
  const StudentCheckList({super.key, required this.students});

  @override
  _StudentCheckListState createState() => _StudentCheckListState();
}

class _StudentCheckListState extends State<StudentCheckList> {
  int? selectedIndex;
  bool selectedList = false;
  String tempName = '';
  String tempClass = '';
  String tempId = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SelectStudentBttn(
          selectedList: selectedList,
          onPressed: () {
            if (selectedList) {
              // تحقق إذا القيم فاضية
              if (tempName.isEmpty || tempClass.isEmpty || tempId.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "الرجاء اختيار الطالب أولاً",
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.grey,
                  ),
                );
                return; // إيقاف العملية
              }
            }

            setState(() {
              selectedList = !selectedList;

              // تخزين البيانات
              getit<CacheHelper>().saveData(key: "studentId", value: tempId);
              getit<CacheHelper>().saveData(
                key: 'studentName',
                value: tempName,
              );
              getit<CacheHelper>().saveData(
                key: 'studentClass',
                value: tempClass,
              );
            });

            // إذا false يروح على الصفحة
            if (!selectedList) {
              GoRouter.of(context).push(
                AppRouter.slectedCoursePage,
                extra: {
                  "id":
                      getit<CacheHelper>().getData(key: "studentId").toString(),
                  "isParent": false,
                },
              );
            }
          },
        ),

        ListView.builder(
          itemCount: widget.students.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final student = widget.students[index];
            bool isSelected = selectedIndex == index;
            final linkedStudent =
                student.id.toString() ==
                getit<CacheHelper>().getData(key: "studentId");
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
                      "الطالب ${index + 1} : ${student.firstName} ${student.lastName}",
                      style: TextStyle(
                        height: 1.5,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    subtitle: Text(
                      "الصف : ${student.classLevel}",
                      style: TextStyle(height: 2, color: AppColor.primaryColor),
                    ),
                    trailing:
                        selectedList
                            ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  tempName =
                                      "${student.firstName} ${student.lastName}";
                                  tempClass = student.classLevel!;
                                  tempId = student.id.toString();
                                  print("$tempName $tempClass $tempId");
                                });
                              },
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        isSelected
                                            ? AppColor.purple.withOpacity(0.2)
                                            : Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color:
                                        isSelected
                                            ? AppColor.purple
                                            : Colors.transparent,
                                    size: 24,
                                  ),
                                ),
                              ),
                            )
                            : SizedBox(
                              width: 40,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      linkedStudent
                                          ? Border.all(color: AppColor.purple)
                                          : Border.all(color: Colors.white),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color:
                                      linkedStudent
                                          ? AppColor.purple
                                          : Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
