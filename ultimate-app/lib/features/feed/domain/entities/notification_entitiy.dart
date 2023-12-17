import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  const NotificationEntity({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.notification,
    required this.date,
  });

  final String id;
  final String chatId;
  final String date;
  final String senderId;
  final String notification;

  @override
  List<Object?> get props => [id, notification, date];
}
