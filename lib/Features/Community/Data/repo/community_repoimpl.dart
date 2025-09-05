import 'dart:io';

import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Community/Data/models/issue_list_model.dart';
import 'package:ajyal/Features/Community/Data/repo/community_repo.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CommunityRepoimp extends CommunityRepo {
  final Api api;
  CommunityRepoimp(this.api);
  /* ************************************************************************ */
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
  /* ************************************************************************ */

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
  /* ************************************************************************ */

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
  /* ************************************************************************ */

  @override
  Future<Either<Failure, String>> addIssue(FormData formData) async {
    try {
      var data = await api.post(EndPoints.addIssue, formData);
      String message = data['message'];
      return Right(message);
    } on Exception catch (e) {
      return left(handleException(e));
    }
  }
  /* ************************************************************************ */

  @override
  Future<Either<Failure, RepliesModel>> getReplies(int issueId) async {
    try {
      final response = await api.get(EndPoints.getReplies + issueId.toString());
      final replies = RepliesModel.fromJson(response);
      return Right(replies);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  /* ************************************************************************ */

  // @override
  // Future<Either<Failure, Reply>> addReply(Map<String, dynamic> body) async {
  //   try {
  //     final data = await api.post(EndPoints.addReply, body);
  //     // نحول JSON إلى Model Reply
  //     final reply = Reply.fromJson(data['data']);
  //     return Right(reply);
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return Left(ServerFailure.fromDioError(e));
  //     }
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, Reply>> addReply(FormData formData) async {
    try {
      final response = await api.post(EndPoints.addReply, formData);

      final reply = Reply.fromJson((response['data']));
      return Right(reply);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
