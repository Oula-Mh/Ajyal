part of 'contact_us_cubit.dart';

sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

// --- States لجلب اسم ولي الأمر ---
final class ContactUsParentLoading extends ContactUsState {}

final class ContactUsParentSuccess extends ContactUsState {
  final String name;
  ContactUsParentSuccess({required this.name});
}

final class ContactUsParentFail extends ContactUsState {
  final String errMessage;
  ContactUsParentFail({required this.errMessage});
}

// --- States لإرسال الرسالة ---
final class ContactUsMessageLoading extends ContactUsState {}

final class ContactUsMessageSuccess extends ContactUsState {}

final class ContactUsMessageFail extends ContactUsState {
  final String errMessage;
  ContactUsMessageFail({required this.errMessage});
}
