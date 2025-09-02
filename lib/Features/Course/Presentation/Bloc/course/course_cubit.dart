import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Features/Course/Data/Model/course_details_model.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repo.dart';
import 'package:ajyal/Features/Subjects/Presentation/Bloc/subject/subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepo courseRepo;
  CourseCubit(this.courseRepo) : super(CourseInitial());

  static CourseCubit get(BuildContext context) => BlocProvider.of(context);
  CourseModel? selectedCourse;
  List<CourseModel> coursesList = [];

  Future<void> getAllCourse() async {
    emit(CourseLoading());
    var response = await courseRepo.getAllCourses();
    if (isClosed) {
      // If it's closed, do nothing. Just exit the function.
      return;
    }
    response.fold((err) => emit(CourseFail(errMsg: err.errorMessage)), (
      courses,
    ) {
      ///  selectedCourse = courses[0];

      final savedId = getit<CacheHelper>().getData(key: "selectedCourseId");
      coursesList = courses;
      final foundCourse = courses.firstWhere(
        (c) => c.id == savedId,
        orElse: () => courses.first,
      );

      selectedCourse = foundCourse;
      selectedCourse = courses.first;

      emit(CourseSuccess(allcourses: courses));
    });
  }

  Future<void> getCourseDetails(int courseId) async {
    emit(CourseLoading());
    var response = await courseRepo.getCourseDetails(courseId);
    response.fold((err) => emit(CourseFail(errMsg: err.errorMessage)), (
      details,
    ) {
      emit(GetDetailsSuccess(model: details));
    });
  }

  void changeCourse(CourseModel course, BuildContext context) {
    getit<CacheHelper>().saveData(key: "selectedCourseId", value: course.id);
    selectedCourse = course;
    emit(CourseSuccess(allcourses: coursesList));
    context.read<SubjectCubit>().fetchSubjects(course.id);
  }
}
