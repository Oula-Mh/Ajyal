import 'package:ajyal/Features/Notification/Data/model/notification_model.dart';
import 'package:ajyal/Features/Notification/Data/repo/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepo repo;
  NotificationCubit(this.repo) : super(NotificationInitial());

  Future<void> getNotifications() async {
    emit(NotificationLoading());
    final response = await repo.getAllNotifications();
    if (isClosed) return;
    response.fold(
      (err) => emit(NotificationFailure(err.errorMessage)),
      (data) => emit(NotificationSuccess(data)),
    );
  }
}
