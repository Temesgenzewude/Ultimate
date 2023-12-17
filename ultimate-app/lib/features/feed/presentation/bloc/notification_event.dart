part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserNotificationsEvent extends NotificationEvent {
  GetUserNotificationsEvent({
    required this.chatId,
    required this.senderId,
  });

  final String chatId;
  final String senderId;
}
