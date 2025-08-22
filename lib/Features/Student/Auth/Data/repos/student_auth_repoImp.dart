import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/teacher_profile_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/repos/student_auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class StudentAuthRepoimp implements StudentAuthRepo {
  final Api api;

  StudentAuthRepoimp(this.api);

  @override
  Future<Either<Failure, CheckStudentInfoModel>> checkStudent(Map data) async {
    try {
      final response = await api.post(EndPoints.checkStudent, data);
      final checkData = CheckStudentInfoModel.fromJson(response);
      print("check Student done !!");
      return Right(checkData);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StudentProfileModel>> getStudentProfile() async {
    try {
      var response = await api.get(EndPoints.studentProfile);
      print("$response\n");
      final studentModel = StudentProfileModel.fromJson(response);
      print("\n${studentModel.data}===========😍\n");
      return Right(studentModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> login(Map data) async {
    try {
      final response = await api.post(EndPoints.login, data);
      print("login in repo implement\n");
      print(response);
      String token = response['data']['token'];
      print("😎token : $token\n");
      // TokenHandle().setToken(token);
      await getit<TokenHandler>().saveToken(
        TokenHandler.studentTokenKey,
        token,
      );
      return Right("login done !");
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register(Map data) async {
    try {
      final response = await api.post(EndPoints.register, data);
      print(response);
      print("register Done !!");
      return Right("register Done !!");
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = await api.post(EndPoints.logout, {});
      final mssg = response["message"];
      print(mssg);
      return Right(mssg);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TeacherProfileModel>> getTeacherProfile(int id) async {
    try {
      var response = await api.get(EndPoints.teacherProfile + id.toString());
      final teacheModel = TeacherProfileModel.fromJson(response['data']);
      print("\n${teacheModel}===========😍\n");
      return Right(teacheModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
