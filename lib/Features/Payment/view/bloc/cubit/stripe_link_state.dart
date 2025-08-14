part of 'stripe_link_cubit.dart';

sealed class StripeLinkState {}

final class StripeLinkInitial extends StripeLinkState {}

final class Loading extends StripeLinkState {}

final class Success extends StripeLinkState {
  final StripeLinkModel stripeLink;
  Success(this.stripeLink);
}

final class Fail extends StripeLinkState {
  final String errMessage;

  Fail({required this.errMessage});
}
