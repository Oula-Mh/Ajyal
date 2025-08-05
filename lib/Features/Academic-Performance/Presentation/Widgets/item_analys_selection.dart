import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/styles/app_color.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemAnalysSelection extends StatefulWidget {
  final void Function(int subjectId)? onSubjectChanged;
  const ItemAnalysSelection({super.key, required this.onSubjectChanged});

  @override
  State<ItemAnalysSelection> createState() => _ItemAnalysSelectionState();
}

class _ItemAnalysSelectionState extends State<ItemAnalysSelection> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SubjectCubit(getit<SubjectRepoimp>())..fetchSubjects(
            getit<CacheHelper>().getData(key: "selectedCourseId"),
          ),
      child: BlocBuilder<SubjectCubit, SubjectState>(
        builder: (context, state) {
          if (state is SubjectLoadedSuccess) {
            final menuItems = state.subjects.map((e) => e.name ?? '').toList();

            // Set the selectedItem only once (first build)

            selectedItem ??= menuItems.first;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "ضمن مادة  ${selectedItem ?? ''}",
                    style: TextStyle(
                      color: AppColor.borderTextField,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.menu, color: Colors.grey),
                    onSelected: (value) {
                      setState(() {
                        selectedItem = value;
                        final selectedSubject = state.subjects.firstWhere(
                          (subject) => subject.name == value,
                        );
                        widget.onSubjectChanged?.call(selectedSubject.id!);
                      });
                    },
                    itemBuilder: (context) {
                      return menuItems.map((item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            );
          } else if (state is SubjectLoading) {
            return Container();
          } else {
            return const Text("لم يتم تحميل المواد");
          }
        },
      ),
    );
  }
}
