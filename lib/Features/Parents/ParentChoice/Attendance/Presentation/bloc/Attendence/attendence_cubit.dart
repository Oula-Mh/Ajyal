import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Model/attendence_model.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Repo/attendence_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'attendence_state.dart';

class AttendenceCubit extends Cubit<AttendenceState> {
  final AttendenceRepo attendenceRepo;
  AttendenceCubit(this.attendenceRepo) : super(AttendenceInitial());

  Future<void> getStudentAbsence() async {
    emit(Loading());
    var response = await attendenceRepo.getStudentAbsence();
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(GetAttendenceFail(errMessage: err.errorMessage)),
      (model) => emit(GetAllAttendenceDays(model: model)),
    );
  }
}
