part of 'issue_list_cubit.dart';

enum IssueSource { faq, all, my }

sealed class IssueListState {}

class IssueListInitial extends IssueListState {}

class IssueListLoading extends IssueListState {}

class AddIssueDone extends IssueListState {
  final String message;

  AddIssueDone({required this.message});
}

class IssueListLoaded extends IssueListState {
  final List<IssueModel> issues;
  final IssueSource source;

  IssueListLoaded({required this.issues, required this.source});
}

class IssueListFailure extends IssueListState {
  final String errMessage;
  IssueListFailure({required this.errMessage});
}
