import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/invoices_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/unpaid_invoice_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoimp extends ProfileRepo {
  final Api api;
  ProfileRepoimp(this.api);

  /* ************** invoices ***************** */
  @override
  Future<Either<Failure, InvoicesModel>> getInvoices(int idStudent) async {
    try {
      final response = await api.get(
        EndPoints.payment + idStudent.toString() + EndPoints.invoices,
      );
      final InvoicesModel invoicesModel = InvoicesModel.fromJson(response);

      return Right(invoicesModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  //==================================================================
  @override
  Future<Either<Failure, MyCoursesModel>> getMyCourses() async {
    try {
      final response = await api.get(EndPoints.myCoursesDetails);
      final MyCoursesModel myCoursesModel = MyCoursesModel.fromJson(response);

      return Right(myCoursesModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  //==================================================================

  @override
  Future<Either<Failure, List<UnpaidInvoicesModel>>> getunPaidInvoices(
    int idStudent,
    int idcourse,
  ) async {
    try {
      final response = await api.get(
        "payment/students/$idStudent/courses/$idcourse/payments",
      );
      List<UnpaidInvoicesModel> unpaidInvoicesModel = [];

      for (var item in response['data']['unpaid_invoices']) {
        unpaidInvoicesModel.add(UnpaidInvoicesModel.fromJson(item));
      }

      return Right(unpaidInvoicesModel);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
