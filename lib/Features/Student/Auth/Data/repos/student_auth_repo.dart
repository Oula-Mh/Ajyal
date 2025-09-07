import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/teacher_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class StudentAuthRepo {
  Future<Either<Failure, String>> login(Map data);
  Future<Either<Failure, StudentProfileModel>> getStudentProfile();
  Future<Either<Failure, TeacherProfileModel>> getTeacherProfile(int id);

  Future<Either<Failure, CheckStudentInfoModel>> checkStudent(Map data);
  Future<Either<Failure, String>> register(Map data);
  Future<Either<Failure, String>> logout();
  Future<Either<Failure, String>> logoutParent();
}
