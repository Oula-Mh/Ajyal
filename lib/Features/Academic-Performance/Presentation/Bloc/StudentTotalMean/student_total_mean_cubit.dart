import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_total_mean_state.dart';

class StudentTotalMeanCubit extends Cubit<StudentTotalMeanState> {
  final AnalysisRepo analysisRepo;
  StudentTotalMeanCubit(this.analysisRepo) : super(StudentTotalMeanInitial());

  Future<void> getTotalMean(int courseId) async {
    emit(StudentTotalMeanLoading());
    final response = await analysisRepo.getTotalMean(courseId);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(StudentTotalMeanFail(errMessage: err.errorMessage)),
      (result) => emit(StudentTotalMeanSuccess(studentTotalMean: result)),
    );
  }
}
