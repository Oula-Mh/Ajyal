import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/Function/functions.dart';
import 'package:ajyal/Features/Payment/Data/model/stripe_model.dart';
import 'package:dartz/dartz.dart';

class PaymentRepoimp {
  final Api api;

  PaymentRepoimp(this.api);

  Future<Either<Failure, StripeLinkModel>> payment() async {
    try {
      final response = await api.get(
        "https://8a07e64a7d4c.ngrok-free.app/stripe/session",
      );
      final model = StripeLinkModel.fromJson(response);
      return Right(model);
    } on Exception catch (e) {
      return Left(handleException(e));
    }
  }
}
