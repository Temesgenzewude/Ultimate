import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

List<Map<String, dynamic>> notifications = [
  <String, dynamic>{
    'title': 'You have added \$200 to your "future" accumulation goal',
    'subTitle': '15 May 2020 10:00 pm',
    'icon': money,
    'bg': primary
  },
  <String, dynamic>{
    'title':
        'You have completed your goal of saving \$20,000 to rent a house in 2023',
    'subTitle': '10/10/2022 17:04',
    'icon': money,
    'bg': green
  },
  <String, dynamic>{
    'title':
        'Philip Schmidt have added \$100 to goal of saving \$20,000 to rent a house in 2023',
    'subTitle': '10/10/2022 17:04',
    'icon': money,
    'bg': stPatricksBlue
  },
  <String, dynamic>{
    'title':
        'Philip Schmidt have added \$100 to goal of saving \$20,000 to rent a house in 2023',
    'subTitle': '10/10/2022 17:04',
    'icon': money,
    'bg': green
  },
  <String, dynamic>{
    'title':
        'Philip Schmidt have added \$100 to goal of saving \$20,000 to rent a house in 2023',
    'subTitle': '10/10/2022 17:04',
    'icon': money,
    'bg': primary
  },
];

class ListNotification extends StatelessWidget {
  const ListNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 28,
              color: Color(0xFF8247E5),
            ),
          ),
        ),
        center: Text(
          'Notification',
          style: headline(color: grey1100),
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(doubleCheck, width: 24, height: 24),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: notifications.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) => AnimationClick(
                  child: Opacity(
                    opacity: index >= 4 ? 0.3 : 1,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: notifications[index]['bg'],
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(
                              notifications[index]['icon']!,
                              width: 28,
                              height: 28,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notifications[index]['title']!,
                                  style: headline(color: grey1100),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  notifications[index]['subTitle']!,
                                  style: caption1(color: grey600),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
