import 'dart:io';

import 'package:ajyal/Features/Community/Data/repo/community_repo.dart';
import 'package:ajyal/Features/Community/data/models/replies_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'send_reply_state.dart';

class SendReplyCubit extends Cubit<SendReplyState> {
  final CommunityRepo communityRepo;
  SendReplyCubit(this.communityRepo) : super(SendReplyInitial());

  Future<void> sendReply({
    required int issueId,
    required String body,
    File? image,
  }) async {
    emit(SendReplyLoading());
    final formData = FormData.fromMap({
      "issue_id": issueId,
      "body": body,
      if (image != null)
        "image": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
    });
    final result = await communityRepo.addReply(formData);

    result.fold(
      (failure) => emit(SendReplyFailure(failure.errorMessage)),
      (reply) => emit(SendReplySuccess(reply)),
    );
  }
}
