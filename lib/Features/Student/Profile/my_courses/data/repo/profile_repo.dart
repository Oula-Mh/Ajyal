import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/invoices_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/my_courses_model.dart';
import 'package:ajyal/Features/Student/Profile/my_courses/data/models/unpaid_invoice_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, InvoicesModel>> getInvoices(int idStudent);
  Future<Either<Failure, MyCoursesModel>> getMyCourses();
  Future<Either<Failure, List<UnpaidInvoicesModel>>> getunPaidInvoices(
    int idStudent,
    int idcourse,
  );
}
