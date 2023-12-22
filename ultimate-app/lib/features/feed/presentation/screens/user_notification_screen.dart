import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/app_bar_cpn.dart';
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
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AnimationClick(
              function: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                careLeft,
                width: 32,
                height: 32,
              ),
            ),
          ),
        ),
        center: Image.asset(logo, width: 40, height: 40),
        right: Row(
          children: [
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    bookmark_simple,
                    width: 28,
                    height: 28,
                    color: grey1100,
                  ),
                ),
              ),
            ),
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    icSearch,
                    width: 28,
                    height: 28,
                    color: grey1100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
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
      ),
    );
  }
}
