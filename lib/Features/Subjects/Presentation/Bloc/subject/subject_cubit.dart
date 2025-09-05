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
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(SubjectError(err.errorMessage)),
      (subjects) => emit(SubjectLoadedSuccess(subjects: subjects)),
    );
  }

  Future<void> fetchSubjects(int courseId) async {
    emit(SubjectLoading());
    var response = await subjectRepo.getSubjects(courseId);
    print("second loading=======");
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(SubjectError(err.errorMessage)),
      (subjects) => emit(SubjectLoadedSuccess(subjects: subjects)),
    );
  }
}

Widget getIconForSubject(String name) {
  switch (name) {
    case 'العربية':
      return getSvg(AppImages.arabic);
    case 'الإنكليزية':
    case 'إنكليزي':
      return getSvg(AppImages.english);
    case 'الفرنسي':
      return getSvg(AppImages.paris);
    case 'الرياضيات':
      return getSvg(AppImages.math);
    case 'العلوم':
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
