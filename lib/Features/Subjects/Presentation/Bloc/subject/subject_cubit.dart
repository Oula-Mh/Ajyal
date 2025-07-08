import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repo.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repoimp.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final SubjectRepo subjectRepo;
  SubjectCubit(this.subjectRepo) : super(SubjectInitial());

  // محاكاة "API" لجلب الصفوف
  // Future<void> fetchClasses() async {
  //   emit(SubjectLoadingClasses());
  //   await Future.delayed(Duration(seconds: 1)); // تمثيل التأخير من الشبكة
  //   emit(
  //     SubjectClassesLoaded(
  //       classes: [
  //         'البكالوريا العلمي',
  //         'البكالوريا الأدبي',
  //         'مكثفة علم الأحياء',
  //         'المكثفة الشاملة',
  //       ],
  //     ),
  //   );
  // }

  Future<void> fetchSubjects(int courseId) async {
    emit(SubjectLoading());
    // final Map<String, List<String>> fakeData = {
    //   'البكالوريا العلمي': [
    //     'اللغة العربية',
    //     'رياضيات',
    //     'علم الأحياء',
    //     'اللغة الإنكليزية',
    //     'الفيزياء',
    //     'الكيمياء',
    //   ],
    //   'البكالوريا الأدبي': [
    //     'اللغة العربية',
    //     'الفلسفة',
    //     'الجغرافيا',
    //     'اللغة الإنكليزية',
    //     'اللغة الفرنسية',
    //     'الكيمياء',
    //   ],
    //   'مكثفة علم الأحياء': ["علم الأحياء"],
    //   'المكثفة الشاملة': ['فيزياء', 'كيمياء', 'إنكليزي'],
    // };
    var response = await subjectRepo.getSubjects(courseId);

    response.fold(
      (err) => emit(SubjectError(err.errorMessage)),
      (subjects) => emit(SubjectLoadedSuccess(subjects: subjects)),
    );

    // final subjects = fakeData[selectedClass] ?? [];
    // emit(
    //   SubjectSubjectsLoaded(selectedClass: selectedClass, subjects: subjects),
    // );
  }
}

Widget getIconForSubject(String name) {
  switch (name) {
    case 'اللغة العربية':
      return getSvg(AppImages.arabic);
    case 'اللغة الإنكليزية':
    case 'إنكليزي':
      return getSvg(AppImages.english);
    case 'اللغة الفرنسية':
      return getSvg(AppImages.paris);
    case 'رياضيات':
      return getSvg(AppImages.math);
    case 'علم الأحياء':
      return getSvg(AppImages.sience);
    case 'الفيزياء':
      return getSvg(AppImages.physics);
    case 'الكيمياء':
      return getSvg(AppImages.chemistry);
    case 'الجغرافيا':
      return getSvg(AppImages.geo);
    case 'الفلسفة':
      return getSvg(AppImages.philosophy);
    case 'التاريخ':
      return getSvg(AppImages.history);
    default:
      return getSvg(AppImages.default1);
  }
}










  // final Map<String, List<String>> _subjectsByClass = {
  //   'البكالوريا العلمي': ['عربي', 'رياضيات', 'علم الأحياء'],
  //   'البكالوريا الأدبي': ['فيزياء', 'كيمياء', 'إنكليزي'],
  //   'مكثفة علم الأحياء': ["علم الأحياء"],
  //   'المكثفة الشاملة': ['فيزياء', 'كيمياء', 'إنكليزي'],
  // };

  // SubjectCubit()
  //   : super(
  //       SubjectState(
  //         classes: ['الصف السابع', 'الصف الثامن', 'الصف التاسع'],
  //         selectedClass: 'الصف السابع',
  //         subjects: ['عربي', 'رياضيات', 'علوم'],
  //       ),
  //     );

  // void changeClass(String selectedClass) {
  //   emit(
  //     state.copyWith(
  //       selectedClass: selectedClass,
  //       subjects: _subjectsByClass[selectedClass] ?? [],
  //     ),
  //   );
  // }

  // 
