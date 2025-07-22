import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'teacher_adv_state.dart';

class TeacherAdvCubit extends Cubit<TeacherAdvState> {
  final AdvRepo advRepo;
  TeacherAdvCubit(this.advRepo) : super(TeacherAdvInitial());

  Future<void> getTeacherAdv({int page = 1}) async {
    emit(TeacherAdvLoading());
    final response = await advRepo.getAllTeacherAdv();
    response.fold(
      (err) => emit(TeacherAdvFailure(errMssg: err.errorMessage)),
      (advs) => emit(TeacherAdvSuccess(model: advs)),
    );
  }
}
