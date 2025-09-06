import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Course/Data/Model/course_details_model.dart';
import 'package:ajyal/Features/Course/Data/Model/course_model.dart';
import 'package:dartz/dartz.dart';

abstract class CourseRepo {
  Future<Either<Failure, List<CourseModel>>> getAllCourses(String id);
  Future<Either<Failure, CourseDetailsModel>> getCourseDetails(int courseId);
}
