import 'package:ajyal/Features/Exam/data/model/exam_current_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exam_current_state.dart';

class ExamCurrentCubit extends Cubit<ExamCurrentState> {
  final ExamRepo examRepo;

  ExamCurrentCubit(this.examRepo) : super(ExamCurrentInitial());

  Future<void> getExamCurrent({required int id}) async {
    emit(ExamCurrentLoading());
    final response = await examRepo.getExamCurrent(id);
    response.fold(
      (err) => emit(ExamCurrentFailure(errMsg: err.errorMessage)),
      (exam) => emit(ExamCurrentSuccess(examCurrentModel: exam)),
    );
  }
}
