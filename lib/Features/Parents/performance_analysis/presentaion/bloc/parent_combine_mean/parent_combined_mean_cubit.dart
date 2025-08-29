import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/models/subject_mean_parent_model.dart';
import 'package:ajyal/Features/Parents/performance_analysis/data/repo/performance_analysis_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'parent_combined_mean_state.dart';

class ParentCombinedMeanCubit extends Cubit<ParentCombinedMeanState> {
  final PerformanceAnalysisRepo performanceAnalysisRepo;

  ParentCombinedMeanCubit(this.performanceAnalysisRepo)
    : super(ParentCombinedMeanInitial());

  Future<void> fetchAll(int idStudent, int idCourse) async {
    emit(ParentCombinedMeanLoading());

    try {
      // تحديد النوع لكل Future بدقة
      final responses = await Future.wait([
        performanceAnalysisRepo.getSubjectMeanParent(idStudent, idCourse),
        performanceAnalysisRepo.getTotalMeanParent(idStudent, idCourse),
      ]);

      final subjectMeanResponse =
          responses[0] as Either<Failure, List<SubjectMeanParentModel>>;
      final totalMeanResponse = responses[1] as Either<Failure, double>;

      subjectMeanResponse.fold(
        (err) => emit(ParentCombinedMeanFailure(errMsg: err.errorMessage)),
        (subjects) {
          totalMeanResponse.fold(
            (err) => emit(ParentCombinedMeanFailure(errMsg: err.errorMessage)),
            (total) => emit(
              ParentCombinedMeanSuccess(subjects: subjects, totalMean: total),
            ),
          );
        },
      );
    } catch (e) {
      emit(ParentCombinedMeanFailure(errMsg: e.toString()));
    }
  }
}
