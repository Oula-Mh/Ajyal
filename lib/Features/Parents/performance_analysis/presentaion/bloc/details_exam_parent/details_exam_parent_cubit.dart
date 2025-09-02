import 'package:ajyal/Features/Parents/performance_analysis/data/models/details_exam_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/repo/performance_analysis_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'details_exam_parent_state.dart';

class DetailsExamParentCubit extends Cubit<DetailsExamParentState> {
  final PerformanceAnalysisRepo performanceAnalysisRepo;
  DetailsExamParentCubit(this.performanceAnalysisRepo)
    : super(DetailsExamParentInitial());

  Future<void> getMarks({required int idStudent, required idSubject}) async {
    emit(DetailsExamParentLoading());
    final response = await performanceAnalysisRepo.getMarks(
      idStudent,
      idSubject,
    );
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(DetailsExamParentFailure(errMsg: err.errorMessage)),
      (exam) => emit(DetailsExamParentSuccess(examDetailsParentModel: exam)),
    );
  }
}
