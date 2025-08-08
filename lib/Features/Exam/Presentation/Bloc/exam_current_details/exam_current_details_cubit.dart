import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_current_details_state.dart';

class ExamCurrentDetailsCubit extends Cubit<ExamCurrentDetailsState> {
  ExamCurrentDetailsCubit(this.examRepo) : super(ExamCurrentDetailsInitial());
  final ExamRepo examRepo;

  Future<void> getExamCurrentDetails({required int id}) async {
    emit(ExamCurrentDetailsLoading());
    final response = await examRepo.getExamCurrentDetails(id);
    response.fold(
      (err) => emit(ExamCurrentDetailsFailure(errMsg: err.errorMessage)),
      (exam) => emit(ExamCurrentDetailsSuccess(examCurrentDetailsModel: exam)),
    );
  }
}
