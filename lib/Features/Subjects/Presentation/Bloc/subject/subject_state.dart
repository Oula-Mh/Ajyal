import 'package:ajyal/Features/Subjects/Data/model/subject_model.dart';

abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectLoadedSuccess extends SubjectState {
  final List<SubjectModel> subjects;

  SubjectLoadedSuccess({required this.subjects});
}

class SubjectError extends SubjectState {
  final String message;
  SubjectError(this.message);
}
