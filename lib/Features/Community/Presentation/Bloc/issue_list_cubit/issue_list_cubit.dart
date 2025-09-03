import 'package:ajyal/Features/Community/Data/model/issue_list_model.dart';
import 'package:ajyal/Features/Community/Data/repo/issue_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'issue_list_state.dart';

class IssueListCubit extends Cubit<IssueListState> {
  final IssueRepo issueRepo;

  IssueListCubit(this.issueRepo) : super(IssueListInitial());

  static IssueListCubit get(BuildContext context) => BlocProvider.of(context);

  final issueController = TextEditingController();

  Future<void> fetchFaqQuestions(int id) async {
    emit(IssueListLoading());
    final response = await issueRepo.getFaqIssues(id);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) =>
          emit(IssueListLoaded(issues: issues, source: IssueSource.faq)),
    );
  }

  Future<void> fetchAllQuestions(int id) async {
    emit(IssueListLoading());
    final response = await issueRepo.getAllIssues(id);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) =>
          emit(IssueListLoaded(issues: issues, source: IssueSource.all)),
    );
  }

  Future<void> fetchMyQuestions(int id) async {
    emit(IssueListLoading());
    final response = await issueRepo.getMyIssues(id);
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) => emit(IssueListLoaded(issues: issues, source: IssueSource.my)),
    );
  }

  Future<void> addIssue(int id, String body) async {
    emit(IssueListLoading());
    final response = await issueRepo.addIssue({
      "curriculum_id": id,
      "body": body,
    });
    if (isClosed) return;
    response.fold(
      (err) => emit(IssueListFailure(errMessage: err.errorMessage)),
      (issues) => emit(AddIssueDone(message: issues)),
    );
  }
}
