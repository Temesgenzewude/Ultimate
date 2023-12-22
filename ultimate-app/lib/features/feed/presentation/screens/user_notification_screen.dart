import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/gradient_text.dart';
import 'package:flutter_ultimate/features/feed/domain/entities/notification_entitiy.dart';
import 'package:flutter_ultimate/features/feed/presentation/widgets/user_notification_widget.dart';

class UserNotificationScreen extends StatefulWidget {
  const UserNotificationScreen({super.key, required this.userNotifications});
  final List<NotificationEntity> userNotifications;
  @override
  State<UserNotificationScreen> createState() => _UserNotificationScreenState();
}

class _UserNotificationScreenState extends State<UserNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Podcast',
                  style: const TextStyle(
                      fontSize: 22,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                AnimationClick(
                  child: Text(
                    'See All',
                    style: headline(color: primary),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: widget.userNotifications.length,
            (context, index) => Column(
              children: [
                UserNotificationWidget(
                  notification: widget.userNotifications[index],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
