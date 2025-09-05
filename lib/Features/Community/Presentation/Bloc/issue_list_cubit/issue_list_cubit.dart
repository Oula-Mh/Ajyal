import 'dart:io';

import 'package:ajyal/Features/Community/Data/models/issue_list_model.dart';
import 'package:ajyal/Features/Community/Data/repo/community_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'issue_list_state.dart';

class IssueListCubit extends Cubit<IssueListState> {
  final CommunityRepo communityRepo;

  IssueListCubit(this.communityRepo) : super(IssueListInitial());

  static IssueListCubit get(BuildContext context) => BlocProvider.of(context);

  final issueController = TextEditingController();

  Future<void> fetchFaqQuestions(int id) async {
    emit(IssueListLoading());
    final response = await communityRepo.getFaqIssues(id);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) =>
          emit(IssueListLoaded(issues: issues, source: IssueSource.faq)),
    );
  }

  Future<void> fetchAllQuestions(int id) async {
    emit(IssueListLoading());
    final response = await communityRepo.getAllIssues(id);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) =>
          emit(IssueListLoaded(issues: issues, source: IssueSource.all)),
    );
  }

  Future<void> fetchMyQuestions(int id) async {
    emit(IssueListLoading());
    final response = await communityRepo.getMyIssues(id);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) => emit(IssueListLoaded(issues: issues, source: IssueSource.my)),
    );
  }

  Future<void> addIssue(int id, String body, File? image) async {
    emit(IssueListLoading());

    final formData = FormData.fromMap({
      "curriculum_id": id,
      "body": body,
      if (image != null)
        "image": await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
    });

    final response = await communityRepo.addIssue(formData);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) => emit(AddIssueDone(message: issues)),
    );
  }
}
