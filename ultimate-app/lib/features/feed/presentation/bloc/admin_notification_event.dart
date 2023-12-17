part of 'admin_notification_bloc.dart';

abstract class AdminNotificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAdminNotificationsEvent extends AdminNotificationEvent {
  GetAdminNotificationsEvent({
    required this.chatId,
    required this.senderId,
  });

  final String chatId;
  final String senderId;
}
