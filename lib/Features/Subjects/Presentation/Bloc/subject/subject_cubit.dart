import 'package:ajyal/Features/Subjects/Data/global.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(SubjectInitial());

  String selectedCourse = courses[0];

  void changeValue(String value) {
    selectedCourse = value;
  }

  // محاكاة "API" لجلب الصفوف
  Future<void> fetchClasses() async {
    emit(SubjectLoadingClasses());
    await Future.delayed(Duration(seconds: 1)); // تمثيل التأخير من الشبكة
    emit(
      SubjectClassesLoaded(
        classes: [
          'البكالوريا العلمي',
          'البكالوريا الأدبي',
          'مكثفة علم الأحياء',
          'المكثفة الشاملة',
        ],
      ),
    );
  }

  Future<void> fetchSubjects(String selectedClass) async {
    emit(SubjectLoadingSubjects(selectedClass));
    await Future.delayed(Duration(seconds: 1));

    final Map<String, List<String>> fakeData = {
      'البكالوريا العلمي': [
        'اللغة العربية',
        'رياضيات',
        'علم الأحياء',
        'اللغة الإنكليزية',
        'الفيزياء',
        'الكيمياء',
      ],
      'البكالوريا الأدبي': [
        'اللغة العربية',
        'الفلسفة',
        'الجغرافيا',
        'اللغة الإنكليزية',
        'اللغة الفرنسية',
        'الكيمياء',
      ],
      'مكثفة علم الأحياء': ["علم الأحياء"],
      'المكثفة الشاملة': ['فيزياء', 'كيمياء', 'إنكليزي'],
    };

    final subjects = fakeData[selectedClass] ?? [];
    emit(
      SubjectSubjectsLoaded(selectedClass: selectedClass, subjects: subjects),
    );
  }
}

IconData getIconForSubject(String name) {
  switch (name) {
    case 'اللغة العربية':
      return Icons.language;
    case 'اللغة الإنكليزية':
    case 'إنكليزي':
      return Icons.translate;
    case 'اللغة الفرنسية':
      return Icons.school;
    case 'رياضيات':
      return Icons.calculate;
    case 'علم الأحياء':
      return Icons.biotech;
    case 'الفيزياء':
      return Icons.bolt;
    case 'الكيمياء':
      return Icons.science;
    case 'الجغرافيا':
      return Icons.public;
    case 'الفلسفة':
      return Icons.psychology;
    default:
      return Icons.book; // أيقونة افتراضية
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
