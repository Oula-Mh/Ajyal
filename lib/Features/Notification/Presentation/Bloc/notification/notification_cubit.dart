import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<int> {
  NotificationCubit() : super(0); // عدد غير المقروءة يبدأ من صفر

  void increase() => emit(state + 1); // لما يوصل إشعار
  void reset() => emit(0); // لما المستخدم يفتح صفحة الاشعارات
}
