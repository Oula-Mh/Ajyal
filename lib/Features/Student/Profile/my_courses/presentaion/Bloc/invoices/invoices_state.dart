part of 'invoices_cubit.dart';

@immutable
abstract class InvoicesState {}

class InvoicesInitial extends InvoicesState {}

final class InvoicesLoading extends InvoicesState {}

final class InvoicesSuccess extends InvoicesState {
  final InvoicesModel invoicesModel;

  InvoicesSuccess({required this.invoicesModel});
}

final class InvoicesFailure extends InvoicesState {
  final String errMsg;
  InvoicesFailure({required this.errMsg});
}
