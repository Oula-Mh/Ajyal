import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class StudentAuthRepo {
  Future<Either<Failure, String>> login(Map data);
  Future<Either<Failure, StudentProfileModel>> getProfile();
  Future<Either<Failure, CheckStudentInfoModel>> checkStudent(Map data);
  Future<Either<Failure, String>> register(Map data);
  Future<Either<Failure, String>> logout();
  // Future<Either<String, String>> login({String accessCode, String password});
  // Future<Either<String, StudentProfileModel>> getProfile();
  // Future<Either<String, CheckStudentInfoModel>> checkStudent({
  //   String firstName,
  //   String lastName,
  //   String acccessCode,
  // });
  // Future<Either<String, String>> register({
  //   String userId,
  //   String acccessCode,
  //   String password,
  //   String rePassword,
  // });
  // Future<Either<String, String>> logout();
}
