import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/repo/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit(this.profileRepo) : super(MyCoursesInitial());
  final ProfileRepo profileRepo;

  Future<void> getMyCoursesDetails() async {
    emit(MyCoursesLoading());
    final response = await profileRepo.getMyCourses();
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(MyCoursesFailure(errMsg: err.errorMessage)),
      (myCourses) => emit(MyCoursesSuccess(myCoursesModel: myCourses)),
    );
  }
}
