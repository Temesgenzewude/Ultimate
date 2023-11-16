import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> items = [
  {'balance': '\$13,579.00', 'icon': lightning, 'subTitle': 'Auto Pay'},
  {
    'balance': '\$13,579.00',
    'icon': arrowUpRight,
    'subTitle': '+\$42.8 (0.5%) today'
  }
];

List<Map<String, String>> sendAgains = [
  {'avt': avtMale2, 'name': 'Christine Stewart', 'time': '2 days ago'},
  {'avt': avtMale2, 'name': 'Christine Stewart', 'time': '1 week'},
  {'avt': avtMale2, 'name': 'Christine Stewart', 'time': '2 month'},
  {'avt': avtMale2, 'name': 'Christine Stewart', 'time': '2 month'},
  {'avt': avtMale2, 'name': 'Christine Stewart', 'time': '2 month'},
  {'avt': avtMale2, 'name': 'Christine Stewart', 'time': '2 month'},
];

class Wallet1 extends StatelessWidget {
  const Wallet1({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: Row(
          children: [
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    avtMale,
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GradientText(
              'Welcome back!',
              style: const TextStyle(
                  fontSize: 22,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ],
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              icSearch,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height / 4,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: Container(
                  width: width - 48,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      gradient: index == 0
                          ? null
                          : LinearGradient(colors: [
                              const Color(0xFFCFE1FD).withOpacity(0.9),
                              const Color(0xFFFFFDE1).withOpacity(0.9),
                            ]),
                      color: index == 0 ? primary : null,
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Balance',
                            style: body(color: grey1100),
                          ),
                          Image.asset(
                            shield,
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        '\$13,579.00',
                        style: title2(color: grey1100),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            items[index]['subTitle']!,
                            style: caption1(color: grey1100),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            items[index]['icon']!,
                            width: 16,
                            height: 16,
                            color: grey1100,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 8, left: 16),
            child: GradientText(
              'Send Again',
              style: const TextStyle(
                  fontSize: 28,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          SizedBox(
            height: height / 4,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: sendAgains.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: Container(
                  width: width / 3.5,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Image.asset(
                          sendAgains[index]['avt']!,
                          width: 56,
                          height: 56,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        sendAgains[index]['name']!,
                        textAlign: TextAlign.center,
                        style: headline(color: grey1100),
                      ),
                      Text(
                        sendAgains[index]['time']!,
                        textAlign: TextAlign.center,
                        style: subhead(color: grey800),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey1100, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(48)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'NETFLIX Premium',
                              style: headline(color: grey100),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: primary),
                              child: Text(
                                '\$4.99',
                                style: caption1(color: grey1100),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'exp 25-05-2024',
                          style: caption1(color: grey400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: AppWidget.typeButtonStartAction(
                      context: context,
                      input: 'Send',
                      bgColor: radicalRed1,
                      borderColor: radicalRed1,
                      textColor: grey1100,
                      borderRadius: 16,
                      onPressed: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppWidget.typeButtonStartAction(
                      context: context,
                      input: 'Request',
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100,
                      borderRadius: 16,
                      onPressed: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
