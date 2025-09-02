import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/teacher_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final StudentAuthRepo studentRepo;
  ProfileCubit(this.studentRepo) : super(ProfileInitial());

  ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getStudentProfile() async {
    emit(ProfileLoading());
    var response = await studentRepo.getStudentProfile();
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(ProfileFail(errorMessage: err.errorMessage)),
      (model) => emit(StudentProfileSuccess(model: model)),
    );
  }

  Future<void> getTeacherProfile(int id) async {
    emit(ProfileLoading());
    var response = await studentRepo.getTeacherProfile(id);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(ProfileFail(errorMessage: err.errorMessage)),
      (model) => emit(TeacherProfileSuccess(model: model)),
    );
  }

  Future<void> logout() async {
    var response = await studentRepo.logout();
    if (isClosed) {
      return;
    }
    response.fold((err) => "Fail to logout", (done) => emit(LogoutDone()));
  }
}
