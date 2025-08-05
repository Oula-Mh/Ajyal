import 'package:ajyal/Features/Academic-Performance/Data/Model/all_quizz_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'all_quizz_cubit_state.dart';

class AllQuizzCubitCubit extends Cubit<AllQuizzCubitState> {
  final AnalysisRepo analysisRepo;
  AllQuizzCubitCubit(this.analysisRepo) : super(AllQuizzCubitInitial());

  Future<void> getQuizzesForAnalysis(int subjectId) async {
    emit(AllQuizzLoading());
    final response = await analysisRepo.getQuizForAnalyis(subjectId);
    response.fold(
      (err) => emit(AllQuizzFail(errMessage: err.errorMessage)),
      (result) => emit(AllQuizzSuccess(model: result)),
    );
  }
}
