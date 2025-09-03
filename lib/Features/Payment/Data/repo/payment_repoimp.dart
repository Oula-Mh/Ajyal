import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Core/utils/constants/end_pointS.dart';
import 'package:ajyal/Features/Payment/Data/model/stripe_model.dart';
import 'package:dartz/dartz.dart';

class PaymentRepoimp {
  final Api api;

  PaymentRepoimp(this.api);

  Future<Either<Failure, StripeLinkModel>> payment(Map data) async {
    try {
      final response = await api.post(
        "${EndPoints.fileBaseUrl}stripe/session",
        data,
      );
      final model = StripeLinkModel.fromJson(response);
      return Right(model);
    } on Exception catch (e) {
      return Left(handleException(e));
    }
  }
}
