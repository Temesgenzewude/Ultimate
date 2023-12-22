import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:flutter_ultimate/subscription_injection.dart';

final prefManager = sl<PrefManager>();

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool? messageNotification = prefManager.messageNotification;
  bool? newsNotification = prefManager.newsNotification;
  bool adminNotificaion = false;

  Map<String, bool?> switchStates = {
    'messageNotification': prefManager.messageNotification,
    'newsNotification': prefManager.newsNotification,
    'adminNotificaion': prefManager.adminNotification,
  };

  handleSwitch(String type, value) {
    print(switchStates);
    setState(() {
      switchStates[type] = value;
    });

    if (type == 'messageNotification') {
      prefManager.messageNotification = value;
    } else if (type == 'newsNotification') {
      prefManager.newsNotification = value;
    } else {
      prefManager.adminNotification = value;
    }
    print(
        'Swtich States$switchStates,\n message Notifications: ${prefManager.messageNotification}, \n news notifications: ${prefManager.newsNotification}');
  }

  Widget item(
    String title,
    Color bgColor,
    String image, {
    bool isSwitch = false,
    required valueUsed,
    Function(bool value)? onToggle,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColor, borderRadius: BorderRadius.circular(16)),
            child: Image.asset(image, width: 28, height: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: headline(color: grey1100),
            ),
          ),
          if (isSwitch) ...[
            CupertinoSwitch(
              activeColor: primary,
              value: switchStates[valueUsed] ?? true,
              onChanged: (value) {
                handleSwitch(valueUsed, value);
              },
            )
          ] else ...[
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              size: 32,
              color: grey500,
            )
          ]
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificaitons Setting',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: AnimationClick(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55.0, horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            item(
              'Message notification',
              grey300,
              bellRinging,
              isSwitch: true,
              valueUsed: 'messageNotification',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: item(
                'News notification',
                grey300,
                bellRinging,
                isSwitch: true,
                valueUsed: 'newsNotification',
              ),
            ),
            item(
              'Admin Notification',
              grey300,
              bellRinging,
              isSwitch: true,
              valueUsed: 'adminNotificaion',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 34.0, vertical: 20),
              child: AppWidget.typeButtonStartAction(
                context: context,
                input: 'Save Settings',
                vertical: 16,
                borderColor: primary,
                borderRadius: 16,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                bgColor: primary,
                textColor: grey1100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
