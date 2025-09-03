import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Community/Data/model/issue_list_model.dart';
import 'package:ajyal/Features/Community/Data/repo/issue_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class IssueRepoImpl implements IssueRepo {
  final Api api;
  IssueRepoImpl(this.api);

  @override
  Future<Either<Failure, List<IssueModel>>> getFaqIssues(int id) async {
    try {
      final response = await api.get(EndPoints.fqaIssue + id.toString());
      final issues =
          (response['data'] as List)
              .map((e) => IssueModel.fromJson(e))
              .toList();
      return Right(issues);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<IssueModel>>> getAllIssues(int id) async {
    try {
      final response = await api.get(EndPoints.normalIssue + id.toString());
      final issues =
          (response['data'] as List)
              .map((e) => IssueModel.fromJson(e))
              .toList();
      return Right(issues);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<IssueModel>>> getMyIssues(int id) async {
    try {
      final response = await api.get(EndPoints.myissue + id.toString());
      final issues =
          (response['data'] as List)
              .map((e) => IssueModel.fromJson(e))
              .toList();
      return Right(issues);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addIssue(Map body) async {
    try {
      var data = await api.post(EndPoints.addIssue, body);
      String message = data['message'];
      return Right(message);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }
}
