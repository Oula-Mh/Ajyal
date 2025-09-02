import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Parents/ParentChoice/Attendance/Data/Model/attendence_model.dart';
import 'package:dartz/dartz.dart';

abstract class AttendenceRepo {
  Future<Either<Failure, CourseAbsenceModel>> getStudentAbsence();
}
