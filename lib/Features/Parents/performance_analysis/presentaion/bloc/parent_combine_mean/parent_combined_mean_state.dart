part of 'parent_combined_mean_cubit.dart';

@immutable
abstract class ParentCombinedMeanState {}

class ParentCombinedMeanInitial extends ParentCombinedMeanState {}

class ParentCombinedMeanLoading extends ParentCombinedMeanState {}

final class ParentCombinedMeanSuccess extends ParentCombinedMeanState {
  final List<SubjectMeanParentModel> subjects;
  final double totalMean;

  ParentCombinedMeanSuccess({required this.subjects, required this.totalMean});
}

final class ParentCombinedMeanFailure extends ParentCombinedMeanState {
  final String errMsg;
  ParentCombinedMeanFailure({required this.errMsg});
}
