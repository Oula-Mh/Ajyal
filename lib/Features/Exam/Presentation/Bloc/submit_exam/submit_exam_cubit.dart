import 'package:ajyal/Features/Exam/data/model/exam_current_details_model.dart';
import 'package:ajyal/Features/Exam/data/repos/exam_repo.dart';
import 'package:ajyal/Features/Exam/utils/question_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'submit_exam_state.dart';

class SubmitExamCubit extends Cubit<SubmitExamState> {
  SubmitExamCubit(this.examRepo) : super(SubmitExamInitial());
  final ExamRepo examRepo;

  Future<void> submitExam(ExamCurrentDetailsModel model) async {
    emit(SubmitExamLoading());

    final formData = buildFormData(model);

    final result = await examRepo.submitExam(formData);

    result.fold(
      (failure) => emit(SubmitExamFailure(failure.errorMessage)),
      (message) => emit(SubmitExamSuccess(message)),
    );
  }
}
