import 'package:ajyal/Features/Parents/Home/Data/models/parent_student_model.dart';
import 'package:ajyal/Features/Parents/Home/Data/repos/home_parent_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'student_link_state.dart';

class StudentLinkCubit extends Cubit<StudentLinkState> {
  HomeParentRepo studentLinkRepo;
  StudentLinkCubit(this.studentLinkRepo) : super(StudentLinkInitial());

  static StudentLinkCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> linkStudent(Map body) async {
    emit(LoadingState());
    var result = await studentLinkRepo.linkStudent(body);
    result.fold(
      (fail) {
        emit(FailState(errMessage: fail.errorMessage));
      },
      (success) {
        emit(StudentLinkSuccessfully(message: success));
      },
    );
  }

  Future<void> getAllParentStudent() async {
    emit(LoadingState());
    var result = await studentLinkRepo.getAllParentStudent();
    if (isClosed) return;
    result.fold(
      (fail) {
        emit(FailState(errMessage: fail.errorMessage));
      },
      (success) {
        emit(AllParentStuentLoaded(listModel: success));
      },
    );
  }
}
