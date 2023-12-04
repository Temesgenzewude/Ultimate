import 'package:flutter/material.dart';

import '../../../../app/widget_support.dart';
import '../../../../common/constant/colors.dart';
import '../../../../common/constant/images.dart';
import '../../../../common/constant/styles.dart';
import '../../../../common/widget/animation_click.dart';

List<Map<String, dynamic>> generals = [
  <String, dynamic>{
    'title': 'Notification',
    'subTitle': 'Open all',
    'icon': bellRinging,
    'bgColor': primary,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Language',
    'subTitle': 'English',
    'icon': text_aa,
    'bgColor': green,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Darkmode',
    'subTitle': 'On',
    'icon': moon,
    'bgColor': green,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Currency',
    'subTitle': 'USD',
    'icon': money,
    'bgColor': green,
    'onTap': () {}
  },
];

class ProfileTwenty extends StatelessWidget {
  const ProfileTwenty({super.key});

  Widget item(String title, Color bgColor, String image, {String? subTitle}) {
    return Container(
      padding: const EdgeInsets.all(16),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: headline(color: grey1100),
                ),
                if (subTitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: subhead(color: grey800),
                  )
                ]
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 32,
            color: grey500,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          backgroundColor: emerald1,
          title: 'Profile Settings'),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: emerald1,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  avtMale3,
                  width: 96,
                  height: 96,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Philip Schmidt',
                    style: title3(color: grey1100),
                  ),
                ),
                Text(
                  'Total saving: \$12,680.99',
                  style: body(color: grey1000),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 4,
                        child: AppWidget.typeButtonStartAction2(
                            context: context,
                            input: 'Upgrade Premium',
                            bgColor: primary,
                            icon: crown_simple,
                            textColor: grey1100,
                            borderColor: primary,
                            sizeAsset: 20,
                            borderRadius: 16,
                            onPressed: () {}),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => AnimationClick(
                      child: item(generals[index]['title'],
                          generals[index]['bgColor'], generals[index]['icon'],
                          subTitle: generals[index]['subTitle']),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: generals.length),
          ),
          AnimationClick(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'LOG OUT',
                style: headline(color: grey400),
              ),
            ),
          )
        ],
      ),
    );
  }
}
