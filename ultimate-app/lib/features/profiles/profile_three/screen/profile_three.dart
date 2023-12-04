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
    'title': 'Notification',
    'subTitle': 'Open all',
    'icon': bellRinging,
    'bgColor': primary,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Gerenal Settings',
    'subTitle': 'Setup your account',
    'icon': gearSix,
    'bgColor': green,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Portfolios',
    'subTitle': '13 show case',
    'icon': suitcaseSimple,
    'bgColor': stPatricksBlue,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Portfolios',
    'subTitle': '13 show case',
    'icon': suitcaseSimple,
    'bgColor': corn1,
    'onTap': () {}
  },
  <String, dynamic>{
    'title': 'Portfolios',
    'subTitle': '13 show case',
    'icon': suitcaseSimple,
    'bgColor': lightSalmon,
    'onTap': () {}
  },
];

class ProfileThree extends StatelessWidget {
  const ProfileThree({super.key});

  Widget item(String title, String subTitle, Color bgColor, String image,
      Function() onTap) {
    return AnimationClick(
      function: onTap,
      child: Container(
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
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: subhead(color: grey800),
                  )
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimationClick(
                  function: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    icArrowLeft,
                    width: 24,
                    height: 24,
                    color: grey1100,
                  ),
                ),
                AnimationClick(
                  child: Image.asset(
                    gearSix,
                    width: 24,
                    height: 24,
                    color: grey1100,
                  ),
                )
              ],
            ),
            Stack(children: [
              Container(
                margin: const EdgeInsets.only(top: 48),
                height: height / 5,
                decoration: BoxDecoration(
                  color: grey200,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        backgroundColor: grey100,
                        child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              avtFemale,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Albert Flores',
                              style: title3(color: grey1100),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(checkbox, width: 24, height: 24)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          'UI/UX Designer',
                          style: body(color: grey800),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '300P',
                              style: headline(color: grey100),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Image.asset(
                              brain,
                              width: 16,
                              height: 16,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.asset(giphy, width: 32, height: 32),
                  ),
                  Text(
                    'Gerenal'.toUpperCase(),
                    style: title4(color: grey1100),
                  )
                ],
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => item(
                    generals[index]['title'],
                    generals[index]['subTitle'],
                    generals[index]['bgColor'],
                    generals[index]['icon'],
                    generals[index]['onTap']),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                itemCount: generals.length),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
