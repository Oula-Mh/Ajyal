import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AdvRepoImpl implements AdvRepo {
  final Api api;
  AdvRepoImpl(this.api);

  @override
  Future<Either<Failure, AdvPaginationModel>> getAllCourseAdv() async {
    try {
      final response = await api.get(EndPoints.allCourseAdv);
      final advResoponse = AdvPaginationModel.fromJson(response['data']);
      return Right(advResoponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdvPaginationModel>> getAllGeneralAdv({
    int page = 1,
  }) async {
    try {
      final response = await api.get(
        EndPoints.allGeneralAdv,
        queryParameters: {
          "page": page, // 🔹 نمرر رقم الصفحة للسيرفر
        },
      );

      final advResponse = AdvPaginationModel.fromJson(response['data']);
      return Right(advResponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdvPaginationModel>> getAllTeacherAdv() async {
    try {
      final response = await api.get(EndPoints.allTeacherAdv);
      final advResoponse = AdvPaginationModel.fromJson(response['data']);
      return Right(advResoponse);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
