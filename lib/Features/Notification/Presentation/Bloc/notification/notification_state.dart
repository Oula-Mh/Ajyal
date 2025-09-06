part of 'notification_cubit.dart';

sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationFailure extends NotificationState {
  final String message;
  NotificationFailure(this.message);
}

class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;
  NotificationSuccess(this.notifications);
}
