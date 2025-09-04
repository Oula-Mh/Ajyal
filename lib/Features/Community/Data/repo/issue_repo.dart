import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Community/Data/model/issue_list_model.dart';
import 'package:ajyal/Features/Community/Data/models/replies_model.dart';
import 'package:dartz/dartz.dart';

abstract class IssueRepo {
  Future<Either<Failure, List<IssueModel>>> getFaqIssues(int id);
  Future<Either<Failure, List<IssueModel>>> getAllIssues(int id);
  Future<Either<Failure, List<IssueModel>>> getMyIssues(int id);
  Future<Either<Failure, String>> addIssue(Map data);
  Future<Either<Failure, RepliesModel>> getReplies(int issueId);
  Future<Either<Failure, Reply>> addReply(Map<String, dynamic> body);
}
