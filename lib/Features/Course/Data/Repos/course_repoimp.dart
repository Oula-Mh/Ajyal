import 'package:ajyal/Cache/cache_helper.dart';
import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/app_service_locator.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Course/Data/Model/course_details_model.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:ajyal/Features/Course/Data/Repos/course_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CourseRepoimp implements CourseRepo {
  final Api api;
  CourseRepoimp(this.api);

  @override
  Future<Either<Failure, List<CourseModel>>> getAllCourses() async {
    try {
      final response = await api.get(EndPoints.myCourse);
      final courses = response['data'];
      final List<CourseModel> coursesList =
          (courses as List).map((json) => CourseModel.fromJson(json)).toList();
      return Right(coursesList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CourseDetailsModel>> getCourseDetails(
    int courseId,
  ) async {
    try {
      final response = await api.get(
        EndPoints.courseDetails + courseId.toString(),
      );
      return right(CourseDetailsModel.fromJson(response['data']));
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
