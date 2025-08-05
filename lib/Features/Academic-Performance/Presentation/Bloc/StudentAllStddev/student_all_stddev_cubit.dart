import 'package:ajyal/Features/Academic-Performance/Data/Model/stddev_model.dart';
import 'package:ajyal/Features/Academic-Performance/Data/Repo/analysis_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'student_all_stddev_state.dart';

class StudentAllStddevCubit extends Cubit<StudentAllStddevState> {
  final AnalysisRepo analysisRepo;
  StudentAllStddevCubit(this.analysisRepo) : super(StudentAllStddevInitial());

  Future<void> getStddevBySubject(int subjectId) async {
    emit(StudentAllStddevLoading());
    final response = await analysisRepo.getStddevBySubject(subjectId);
    response.fold(
      (err) => emit(StudentAllStddevFail(errMessage: err.errorMessage)),
      (result) => emit(StudentAllStddevSuccess(model: result)),
    );
  }
}
