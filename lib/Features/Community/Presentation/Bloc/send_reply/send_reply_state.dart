part of 'send_reply_cubit.dart';

@immutable
abstract class SendReplyState {}

class SendReplyInitial extends SendReplyState {}

class SendReplyLoading extends SendReplyState {}

class SendReplyFailure extends SendReplyState {
  final String errMessage;
  SendReplyFailure(this.errMessage);
}

class SendReplySuccess extends SendReplyState {
  final Reply reply; // هنا نستخدم Model بدل Map
  SendReplySuccess(this.reply);
}
