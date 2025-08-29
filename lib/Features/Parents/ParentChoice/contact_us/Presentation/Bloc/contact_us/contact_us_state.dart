part of 'contact_us_cubit.dart';

sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsLoading extends ContactUsState {}

final class ContactUsFail extends ContactUsState {
  final String errMessage;

  ContactUsFail({required this.errMessage});
}

final class ContactUsSuccess extends ContactUsState {
  final String name;

  ContactUsSuccess({required this.name});
}
