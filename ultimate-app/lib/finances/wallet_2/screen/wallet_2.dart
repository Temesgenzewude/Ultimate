import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{'icon': shield, 'title': 'Saving', 'onTap': () {}},
  <String, dynamic>{'icon': shield, 'title': 'Bill', 'onTap': () {}},
  <String, dynamic>{'icon': shield, 'title': 'P2P', 'onTap': () {}}
];
List<Map<String, dynamic>> transactions = [
  <String, dynamic>{
    'icon': clock,
    'title': 'Foody',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': clock,
    'title': 'Foody',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'subTitle': 'Subtitle',
    'money': '-\$16.48',
    'onTap': () {}
  },
];

class Wallet2 extends StatelessWidget {
  const Wallet2({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              barcode,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                chartBarHorizontal,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  icSearch,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          Row(
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
                'Hi! Peter',
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
          const SizedBox(height: 16),
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey1100, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '\$13,579.00',
                                  style: title3(color: grey100),
                                ),
                                const SizedBox(width: 8),
                                AnimationClick(
                                  child: Image.asset(
                                    icKeyboardDown,
                                    width: 32,
                                    height: 32,
                                    color: grey100,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Balance',
                              style: body(color: grey100.withOpacity(0.5)),
                            )
                          ],
                        ),
                      ),
                      Image.asset(shield, width: 32, height: 32)
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Deposit',
                            colorAsset: grey1100,
                            icon: icArrowDown,
                            bgColor: primary,
                            borderColor: primary,
                            textColor: grey1100,
                            borderRadius: 16,
                            onPressed: () {}),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Withdraw',
                            bgColor: green,
                            icon: icArrowUp,
                            borderColor: green,
                            textColor: grey1100,
                            borderRadius: 16,
                            onPressed: () {}),
                      ),
                      const SizedBox(width: 8),
                      AnimationClick(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: grey1000,
                              borderRadius: BorderRadius.circular(16)),
                          child: Image.asset(
                            dotsThreeVertical,
                            width: 24,
                            height: 24,
                            color: grey600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 7,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 4),
              itemBuilder: (context, index) => AnimationClick(
                function: items[index]['onTap'],
                child: Container(
                  width: (width - 16) / 3,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(items[index]['icon'], width: 32, height: 32),
                      Text(
                        items[index]['title'],
                        style: body(color: grey1100),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16, left: 16),
            child: GradientText(
              'Transaction',
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
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 4),
            itemBuilder: (context, index) => AnimationClick(
              function: transactions[index]['onTap'],
              child: Container(
                width: width,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: grey300,
                            borderRadius: BorderRadius.circular(99)),
                        child: Image.asset(transactions[index]['icon'],
                            width: 24, height: 24)),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                transactions[index]['title'],
                                style: headline(color: grey1100),
                              ),
                              Text(
                                transactions[index]['money'],
                                style: headline(color: grey1100),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            transactions[index]['subTitle'],
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
          const SizedBox(height: 64),
        ],
      ),
    );
  }
}
