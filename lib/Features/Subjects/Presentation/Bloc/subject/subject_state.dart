abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectLoadingClasses extends SubjectState {}

class SubjectClassesLoaded extends SubjectState {
  final List<String> classes;
  final String? selectedClass;

  SubjectClassesLoaded({required this.classes, this.selectedClass});
}

class SubjectLoadingSubjects extends SubjectState {
  final String selectedClass;
  SubjectLoadingSubjects(this.selectedClass);
}

class SubjectSubjectsLoaded extends SubjectState {
  final String selectedClass;
  final List<String> subjects;

  SubjectSubjectsLoaded({required this.selectedClass, required this.subjects});
}

class SubjectError extends SubjectState {
  final String message;
  SubjectError(this.message);
}
