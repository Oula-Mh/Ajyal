import 'package:ajyal/Core/Network/Errors/failure_handle.dart' show Failure;
import 'package:ajyal/Features/Community/Data/models/issue_list_model.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CommunityRepo {
  Future<Either<Failure, List<IssueModel>>> getFaqIssues(int id);
  Future<Either<Failure, List<IssueModel>>> getAllIssues(int id);
  Future<Either<Failure, List<IssueModel>>> getMyIssues(int id);
  Future<Either<Failure, String>> addIssue(FormData formData);
  Future<Either<Failure, RepliesModel>> getReplies(int issueId);
  // Future<Either<Failure, Reply>> addReply(Map<String, dynamic> body);
  Future<Either<Failure, Reply>> addReply(FormData formData);
}
