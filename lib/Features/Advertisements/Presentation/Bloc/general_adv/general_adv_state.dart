part of 'general_adv_cubit.dart';

sealed class GeneralAdvState {}

final class GeneralAdvInitial extends GeneralAdvState {}

final class GeneralAdvSuccess extends GeneralAdvState {
  final AdvPaginationModel model;
  GeneralAdvSuccess({required this.model});
}

final class GeneralAdvLoading extends GeneralAdvState {}

final class GeneralAdvFailure extends GeneralAdvState {
  final String errMssg;

  GeneralAdvFailure({required this.errMssg});
}
