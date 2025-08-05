import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:ajyal/Features/Subjects/Data/repo/subject_repo.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectCubit extends Cubit<SubjectState> {
  final SubjectRepo subjectRepo;
  SubjectCubit(this.subjectRepo) : super(SubjectInitial());

  Future<void> subjectForTeacher(int id) async {
    emit(SubjectLoading());
    var response = await subjectRepo.getSubjectForTeacher(id);
    response.fold(
      (err) => emit(SubjectError(err.errorMessage)),
      (subjects) => emit(SubjectLoadedSuccess(subjects: subjects)),
    );
  }

  Future<void> fetchSubjects(int courseId) async {
    emit(SubjectLoading());
    var response = await subjectRepo.getSubjects(courseId);
    print("second loading=======");
    response.fold(
      (err) => emit(SubjectError(err.errorMessage)),
      (subjects) => emit(SubjectLoadedSuccess(subjects: subjects)),
    );
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
