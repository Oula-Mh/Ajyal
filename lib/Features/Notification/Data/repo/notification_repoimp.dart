import 'package:ajyal/Core/Network/Api/api_consumer.dart';
import 'package:ajyal/Core/Network/Errors/failure_handle.dart';
import 'package:ajyal/Core/utils/constants/end_points.dart';
import 'package:ajyal/Features/Notification/Data/model/notification_model.dart';
import 'package:ajyal/Features/Notification/Data/repo/notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepoimp implements NotificationRepo {
  final Api api;
  NotificationRepoimp(this.api);

  @override
  Future<Either<Failure, List<NotificationModel>>> getAllNotifications() async {
    try {
      final response = await api.get(EndPoints.allNotification);
      final List data = response['data'] ?? [];
      final notifications =
          data.map((e) => NotificationModel.fromJson(e)).toList();
      return Right(notifications);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
