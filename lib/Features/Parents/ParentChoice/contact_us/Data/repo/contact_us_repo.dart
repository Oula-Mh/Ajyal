import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:dartz/dartz.dart';

abstract class ContactUsRepo {
  Future<Either<Failure, String>> getParentInfo();
  Future<Either<Failure, String>> sendMessage(Map body);
}
