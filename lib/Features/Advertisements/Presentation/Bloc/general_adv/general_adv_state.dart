part of 'general_adv_cubit.dart';

sealed class GeneralAdvState {}

final class GeneralAdvInitial extends GeneralAdvState {}

final class GeneralAdvSuccess extends GeneralAdvState {
  final AdvPaginationModel model;
  GeneralAdvSuccess({required this.model});
}

final class AdvLoading extends GeneralAdvState {}

final class AdvFailure extends GeneralAdvState {
  final String errMssg;

  AdvFailure({required this.errMssg});
}
