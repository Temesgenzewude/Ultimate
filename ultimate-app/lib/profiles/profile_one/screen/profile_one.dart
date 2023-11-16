import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';

import '../../../common/widget/animation_click.dart';

class ProfileOne extends StatelessWidget {
  const ProfileOne({super.key});

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(16)),
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
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: Image.asset(
                        avtFemale,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Albert Flores',
                        style: title3(color: grey1100),
                      ),
                    ),
                    Text(
                      'UI/UX Designer',
                      style: body(color: grey800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 32, left: 48, right: 48),
                      child: AppWidget.typeButtonStartAction2(
                          context: context,
                          input: 'Go Pro Account!',
                          onPressed: () {},
                          icon: cat,
                          sizeAsset: 24,
                          bgColor: primary,
                          borderColor: primary,
                          textColor: grey1100),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          item('Notification', 'Open all', grey300, bellRinging,
                              () {
                            print('Get here');
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: item('Gerenal Settings',
                                'Setup your account', grey300, gearSix, () {
                              print('Get here');
                            }),
                          ),
                          item('Portfolios', '13 show case', grey300,
                              suitcaseSimple, () {
                            print('Get here');
                          })
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimationClick(
                          child: Text(
                            'Help Center',
                            style: body(color: grey600),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimationClick(
                              child: Text(
                                'Logout',
                                style: body(color: grey600),
                              ),
                            ),
                            Text(
                              'Feb 2021',
                              style: body(color: grey600),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
