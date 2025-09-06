import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Features/Notification/Data/model/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationModel>>> getAllNotifications();
}
