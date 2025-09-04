import 'package:ajyal/Core/Network/Errors/failure_handle.dart' show Failure;
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:dartz/dartz.dart';

abstract class CommunityRepo {
  Future<Either<Failure, RepliesModel>> getReplies(int issueId);
  Future<Either<Failure, Reply>> addReply(Map<String, dynamic> body);
}
