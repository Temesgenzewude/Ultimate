import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';
import 'package:intl/intl.dart';

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
    var formattedDate = '';
    if (json['date'] != null) {
      String originalDateString = json['date'];
      DateTime originalDate = DateTime.parse(originalDateString);
      formattedDate = DateFormat('yyyy-MM-dd').format(originalDate);
    } else if (json['createdAt'] != null) {
      String originalDateString = json['createdAt'];
      DateTime originalDate = DateTime.parse(originalDateString);
      formattedDate = DateFormat('yyyy-MM-dd').format(originalDate);  
    }
    
    String notificationText = '';
    if (json['message'] != null) {
      notificationText = json['message'];
    } else if (json['notification'] != null) {
      notificationText = json['notification'];
    }
    return NotificationModel(
      id: json['id'] != null ? json['id'] : '',
      chatId: json['chatId'] != null ? json['chatId'] : '',
      senderId: json['senderId'] != null ? json['senderId'] : '',
      notification: notificationText,
      date: formattedDate,
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
