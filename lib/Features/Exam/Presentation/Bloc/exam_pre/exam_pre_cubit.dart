import 'package:ajyal/Features/Exam/data/model/exam_pre_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_pre_state.dart';

class ExamPreCubit extends Cubit<ExamPreState> {
  final ExamRepo examRepo;
  ExamPreCubit(this.examRepo) : super(ExamPreInitial());

  Future<void> getExamPre({required int id}) async {
    emit(ExamPreLoading());
    final response = await examRepo.getExamPre(5);
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(ExamPreFailure(errMsg: err.errorMessage)),
      (exam) => emit(ExamPreSuccess(examPreModel: exam)),
    );
  }
}
