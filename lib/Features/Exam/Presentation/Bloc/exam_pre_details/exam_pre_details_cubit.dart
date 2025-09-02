import 'package:ajyal/Features/Exam/data/model/exam_pre_details_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_pre_details_state.dart';

class ExamPreDetailsCubit extends Cubit<ExamPreDetailsState> {
  ExamPreDetailsCubit(this.examRepo) : super(ExamPreDetailsInitial());
  final ExamRepo examRepo;

  Future<void> getExamPreDetails({required int id}) async {
    emit(ExamPreDetailsLoading());
    final response = await examRepo.getExamPreDetails(id);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(ExamPreDetailsFailure(errMsg: err.errorMessage)),
      (exam) => emit(ExamPreDetailsSuccess(examPreDetailsModel: exam)),
    );
  }
}
