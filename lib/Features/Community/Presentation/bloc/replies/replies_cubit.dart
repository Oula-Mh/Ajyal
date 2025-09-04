import 'package:ajyal/Features/Community/Data/repo/issue_repo.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'replies_state.dart';

class RepliesCubit extends Cubit<RepliesState> {
  RepliesCubit(this.issueRepo) : super(RepliesInitial());
  IssueRepo issueRepo;
  Future<void> fetchReplies(int issueId) async {
    emit(RepliesLoading());
    final response = await issueRepo.getReplies(issueId);
    if (isClosed) return;
    response.fold(
      (err) => emit(RepliesFailure(errMsg: err.errorMessage)),
      (data) => emit(RepliesSuccess(repliesModel: data)),
    );
  }
}
