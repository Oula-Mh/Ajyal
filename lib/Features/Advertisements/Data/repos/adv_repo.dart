import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Advertisements/Data/model/ad_pagination_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdvRepo {
  Future<Either<Failure, AdvPaginationModel>> getAllCourseAdv();

  Future<Either<Failure, AdvPaginationModel>> getAllTeacherAdv();

  Future<Either<Failure, AdvPaginationModel>> getAllGeneralAdv();
}
