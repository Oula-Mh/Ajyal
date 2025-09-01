part of 'unPaid_invoices_cubit.dart';

@immutable
abstract class UnPaidInvoicesState {}

class UnPaidInvoicesInitial extends UnPaidInvoicesState {}

final class UnPaidInvoicesLoading extends UnPaidInvoicesState {}

final class UnPaidInvoicesSuccess extends UnPaidInvoicesState {
  final List<UnpaidInvoicesModel> unpaidInvoicesModel;

  UnPaidInvoicesSuccess({required this.unpaidInvoicesModel});
}

final class UnPaidInvoicesFailure extends UnPaidInvoicesState {
  final String errMsg;
  UnPaidInvoicesFailure({required this.errMsg});
}
