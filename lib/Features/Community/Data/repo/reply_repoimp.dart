import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:ajyal/Features/Community/data/repo/community_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CommunityRepoimp extends CommunityRepo {
  final Api api;
  CommunityRepoimp(this.api);

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

  @override
  Future<Either<Failure, Reply>> addReply(Map<String, dynamic> body) async {
    try {
      final data = await api.post(EndPoints.addReply, body);
      // نحول JSON إلى Model Reply
      final reply = Reply.fromJson(data['data']);
      return Right(reply);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
