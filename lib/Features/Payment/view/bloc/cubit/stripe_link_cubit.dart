import 'package:ajyal/Features/Payment/Data/model/stripe_model.dart';
import 'package:ajyal/Features/Payment/Data/repo/payment_repoimp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stripe_link_state.dart';

class StripeLinkCubit extends Cubit<StripeLinkState> {
  final PaymentRepoimp repoimp;
  StripeLinkCubit(this.repoimp) : super(StripeLinkInitial());

  Future<void> payment(String invoice) async {
    emit(LoadingPay());
    var response = await repoimp.payment({"invoice_id": invoice});
    if (isClosed) {
      return;
    }
    response.fold(
      (err) => emit(Fail(errMessage: err.errorMessage)),
      (model) => emit(Success(model)),
    );
  }
}
