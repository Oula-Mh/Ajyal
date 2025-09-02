import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Api/dio_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Model/attendence_model.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Repo/attendence_repo.dart';
import 'package:dartz/dartz.dart';

class AttendenceRepoimpl implements AttendenceRepo {
  final Api api;

  AttendenceRepoimpl(this.api);
  @override
  Future<Either<Failure, CourseAbsenceModel>> getStudentAbsence() async {
    try {
      final response = await api.get(EndPoints.absenceDay);
      final absenceDay = response['data'];
      return Right(absenceDay);
    } on Exception catch (e) {
      return Left(handleException(e));
    }
  }
}
