import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> functions = [
  {
    'title': 'Remove Ads',
    'subTitle': 'Remove all ads that appear on the app',
    'image': umbela
  },
  {
    'title': 'Unlimited Task',
    'subTitle': 'Prioritize unlimited tasks for you',
    'image': rocket
  },
  {
    'title': 'Invite Friends',
    'subTitle': 'Accomplish goals with friends and family',
    'image': couple
  }
];

class UpgradePremium extends StatelessWidget {
  const UpgradePremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: AppWidget.typeButtonStartAction2(
            context: context,
            input: 'Buy now - \$0.99/year',
            bgColor: primary,
            textColor: grey1100,
            borderColor: primary,
            borderRadius: 16,
            onPressed: () async {
              Navigator.of(context).pop();
            }),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 16, top: 64, right: 16),
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
                  )),
              Text(
                'Premium',
                style: title4(color: grey1100),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(crown2, width: 64, height: 64),
                    Positioned(
                        left: 24,
                        bottom: -24,
                        child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(0),
                            child: Image.asset(ornament)))
                  ],
                ),
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Be ',
                    style: title1(color: grey900),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'happies',
                        style: title1(color: corn1),
                      ),
                      TextSpan(
                        text: '.',
                        style: title1(color: grey900),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                GradientText(
                  'Upgrade Premium',
                  style: const TextStyle(
                      fontSize: 36,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 48),
                  itemCount: functions.length,
                  separatorBuilder: (context, index) => const SizedBox(),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Image.asset(
                              functions[index]['image']!,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  functions[index]['title']!,
                                  style: title4(color: grey1100),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  functions[index]['subTitle']!,
                                  style: callout(
                                      color: grey1100.withOpacity(0.5),
                                      fontWeight: '400'),
                                ),
                                AppWidget.divider(context,
                                    vertical: 24, color: grey200)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
