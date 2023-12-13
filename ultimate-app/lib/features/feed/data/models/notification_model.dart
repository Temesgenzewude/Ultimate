import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required String id,
    required String chatId,
    required String senderId,
    required String date,
    required String notification,
  }) : super(
            id: id,
            chatId: chatId,
            senderId: senderId,
            date: date,
            notification: notification);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] != null ? json['id'] : '',
      chatId: json['chatId'] != null ? json['chatId'] : '',
      senderId: json['senderId'] != null ? json['senderId'] : '',
      notification: json['date'] != null ? json['date'] : '',
      date: json['notification'] != null ? json['notification'] : '',
    );
  }
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'authorName': authorName,
  //     'newsExcerpt': newsExcerpt,
  //     'dateAuthorered': dateAuthorered,
  //     'newsContent': newsContent,
  //   };
  // }
}
