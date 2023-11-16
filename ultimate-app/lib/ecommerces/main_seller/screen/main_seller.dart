import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> orders = [
  <String, dynamic>{'title': 'Pending', 'amount': 36},
  <String, dynamic>{'title': 'Shipping', 'amount': 236},
  <String, dynamic>{'title': 'Return/Refunds', 'amount': 13},
  <String, dynamic>{'title': 'Review', 'amount': 108}
];

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'title': 'My Product',
    'image': houseSimple,
    'bg': primary,
    'iconColor': corn1
  },
  <String, dynamic>{
    'title': 'Finance',
    'image': money,
    'bg': green,
  },
  <String, dynamic>{
    'title': 'Analytics',
    'image': chartBar,
    'bg': lightSalmon,
    'iconColor': const Color(0xFF8247E5)
  },
];

class MainSeller extends StatelessWidget {
  const MainSeller({Key? key}) : super(key: key);

  Widget item(Map<String, dynamic> item) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: item['bg']!, borderRadius: BorderRadius.circular(48)),
          child: Image.asset(
            item['image'],
            height: 20,
            width: 20,
            color: item['iconColor'],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item['title'],
          style: body(color: grey1100),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              bellSimple,
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
                chatCircleText,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  circlesFour,
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(
                    avtFemale,
                    width: 56,
                    height: 56,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        'Ultimate UI KIT',
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
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Linkstorehere',
                            style: body(color: grey800),
                          ),
                          const SizedBox(width: 8),
                          AnimationClick(
                              child: Image.asset(
                            copy,
                            width: 24,
                            height: 24,
                            color: corn1,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: primary),
                    child: Image.asset(
                      icArrowRight,
                      width: 24,
                      height: 24,
                      color: grey1100,
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    'Total Balance',
                    style: const TextStyle(
                        fontSize: 24,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$12,860.44',
                    style: header(color: grey1100),
                  ),
                  const SizedBox(height: 8),
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(colors: [
                          const Color(0xFFCFE1FD).withOpacity(0.9),
                          const Color(0xFFFFFDE1).withOpacity(0.9),
                        ]),
                      ),
                      child: Text(
                        '\$3,462.8 Withdraw',
                        style: callout(color: grey100),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Update 20:18 today',
                    style: callout(color: grey1100.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                GradientText(
                  'Order Sumary',
                  style: const TextStyle(
                      fontSize: 24,
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
                    padding: const EdgeInsets.only(top: 24, bottom: 8),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => AnimationClick(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  orders[index]['title'],
                                  style: body(color: grey1100),
                                ),
                              ),
                              Text(
                                orders[index]['amount'].toString(),
                                style: headline(color: grey600),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                size: 32,
                                color: grey600,
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => AppWidget.divider(
                        context,
                        vertical: 16,
                        color: grey300),
                    itemCount: orders.length)
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimationClick(child: item(items[0])),
              AnimationClick(child: item(items[1])),
              AnimationClick(child: item(items[2]))
            ],
          )
        ],
      ),
    );
  }
}
