import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:ajyal/Features/Advertisements/Data/repos/adv_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course_adv_state.dart';

class CourseAdvCubit extends Cubit<CourseAdvState> {
  final AdvRepo advRepo;
  CourseAdvCubit(this.advRepo) : super(CourseAdvInitial());

  Future<void> getCourseAdv({int page = 1}) async {
    emit(AdvLoading());
    final response = await advRepo.getAllCourseAdv();
    response.fold(
      (err) => emit(AdvFailure(errMssg: err.errorMessage)),
      (advs) => emit(CourseAdvSuccess(model: advs)),
    );
  }
}
