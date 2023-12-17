import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';

class UserNotificationWidget extends StatefulWidget {
  const UserNotificationWidget({super.key, required this.notification});
  final NotificationEntity notification;
  @override
  State<UserNotificationWidget> createState() => _UserNotificationWidgetState();
}

class _UserNotificationWidgetState extends State<UserNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimationClick(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: grey200),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                reading_habit_6,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.notification.notification,
                    style: headline(color: grey1100),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.notification.date,
                          style: caption1(color: grey600),
                        ),
                      ),
                      AnimationClick(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            headphone,
                            width: 16,
                            height: 16,
                            color: grey1100,
                          ),
                          decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
