import 'package:ajyal/Features/Community/Data/repo/community_repo.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'replies_state.dart';

class RepliesCubit extends Cubit<RepliesState> {
  RepliesCubit(this.communityRepo) : super(RepliesInitial());
  CommunityRepo communityRepo;
  Future<void> fetchReplies(int issueId) async {
    emit(RepliesLoading());
    final response = await communityRepo.getReplies(issueId);
    if (isClosed) return;
    response.fold(
      (err) => emit(RepliesFailure(errMsg: err.errorMessage)),
      (data) => emit(RepliesSuccess(repliesModel: data)),
    );
  }
}
