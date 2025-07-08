import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/Network/token_handle.dart';
import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/check_student_info_model.dart';
import 'package:ajyal/Features/Student/Auth/Data/models/student_profile_model.dart';
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
  Future<Either<Failure, StudentProfileModel>> getProfile() async {
    try {
      var response = await api.get(EndPoints.profile);
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
      await getit<TokenHandler>().saveToken(token);
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

  // final Api api;

  // StudentAuthRepoimp(this.api);

  // @override
  // Future<Either<String, CheckStudentInfoModel>> checkStudent({
  //   String? firstName,
  //   String? lastName,
  //   String? acccessCode,
  // }) async {
  //   try {
  //     final response = await api.post(EndPoints.checkStudent, {
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "access_code": acccessCode,
  //     });
  //     final checkData = CheckStudentInfoModel.fromJson(response);
  //     print("check Student done !!");
  //     return Right(checkData);
  //   } on Exception catch (e) {
  //     if (e is ServerException) {
  //       return left(e.errModel.errorMessage);
  //     }
  //     return left(e.toString());
  //   }
  // }

  // @override
  // Future<Either<String, StudentProfileModel>> getProfile() async {
  //   try {
  //     var response = await api.get(EndPoints.profile);
  //     print("$response\n");
  //     final studentModel = StudentProfileModel.fromJson(response);
  //     print("\n${studentModel.data}===========😍\n");
  //     return Right(studentModel);
  //   } on Exception catch (e) {
  //     if (e is ServerException) {
  //       return left(e.errModel.errorMessage);
  //     }
  //     return left(e.toString());
  //   }
  // }

  // @override
  // Future<Either<String, String>> login({
  //   String? accessCode,
  //   String? password,
  // }) async {
  //   try {
  //     final response = await api.post(EndPoints.login, {
  //       "access_code": accessCode,
  //       "password": password,
  //     });
  //     print("login in repo implement\n");
  //     print(response);
  //     String token = response['data']['token'];
  //     print("😎token : $token\n");
  //     CacheHelper().saveData(key: 'token', value: token);
  //     return Right("login done !");
  //   } on Exception catch (e) {
  //     if (e is ServerException) {
  //       return left(e.errModel.errorMessage);
  //     }
  //     return left(e.toString());
  //   }
  // }

  // @override
  // Future<Either<String, String>> register({
  //   String? userId,
  //   String? acccessCode,
  //   String? password,
  //   String? rePassword,
  // }) async {
  //   try {
  //     final response = await api.post(EndPoints.register, {
  //       "user_id": userId,
  //       "access_code": acccessCode,
  //       "password": password,
  //       "password_confirmation": rePassword,
  //     });
  //     print(response);
  //     print("register Done !!");
  //     return Right("register Done !!");
  //   } on Exception catch (e) {
  //     if (e is ServerException) {
  //       return left(e.errModel.errorMessage);
  //     }
  //     return left(e.toString());
  //   }
  // }

  // @override
  // Future<Either<String, String>> logout() async {
  //   try {
  //     final response = await api.post("/student/logout", {});
  //     final mssg = response["message"];
  //     print(mssg);
  //     return Right(mssg);
  //   } on Exception catch (e) {
  //     if (e is ServerException) {
  //       return left(e.errModel.errorMessage);
  //     }
  //     return left(e.toString());
  //   }
  // }
}
