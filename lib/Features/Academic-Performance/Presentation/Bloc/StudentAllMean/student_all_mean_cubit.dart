import 'package:ajyal/Features/Academic-Performance/Data/Model/avg_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'student_all_mean_state.dart';

class StudentAllMeanCubit extends Cubit<StudentAllMeanState> {
  final AnalysisRepo analysisRepo;
  StudentAllMeanCubit(this.analysisRepo) : super(StudentAllMeanInitial());

  Future<void> getAverageBySubject(int subjectId) async {
    emit(StudentAllMeanLoading());
    final response = await analysisRepo.getAverageBySubject(subjectId);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(StudentAllMeanFail(errMessage: err.errorMessage)),
      (result) => emit(StudentAllMeanSuccess(model: result)),
    );
  }
}
