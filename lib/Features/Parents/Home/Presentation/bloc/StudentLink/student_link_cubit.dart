import 'package:ajyal/Features/Parents/Home/Data/repos/student_link_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'student_link_state.dart';

class StudentLinkCubit extends Cubit<StudentLinkState> {
  StudentLinkRepo studentLinkRepo;
  StudentLinkCubit(this.studentLinkRepo) : super(StudentLinkInitial());

  static StudentLinkCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> linkStudent(Map body) async {
    emit(StudentLinkLoading());
    var result = await studentLinkRepo.linkStudent(body);
    result.fold(
      (fail) {
        emit(StudentLinkFail(errMessage: fail.errorMessage));
      },
      (success) {
        emit(StudentLinkSuccessfully(message: success));
      },
    );
  }
}
