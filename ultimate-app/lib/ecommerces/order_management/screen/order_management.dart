import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';

import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<String> foods = [chicken_bucket, coffee, french_fries_2];

List<Map<String, String>> populars = [
  {
    'image': chicken_bucket,
    'title': 'Taquito Cheese',
    'rate': '+15% this month',
    'order': '🛵️ 35 Order'
  },
  {
    'image': french_fries_2,
    'title': 'Ice Cream Jolibee',
    'rate': '+15% this month',
    'order': '🛵️ 35 Order'
  },
  {
    'image': hot_dog,
    'title': 'Chalupa Supreme',
    'rate': '+15% this month',
    'order': '🛵️ 35 Order'
  },
];

class OrderManagement extends StatelessWidget {
  const OrderManagement({Key? key}) : super(key: key);

  Widget itemPopular(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: Image.asset(item['image']!))),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title']!,
                style: headline(color: grey1100),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  item['rate']!,
                  style: body(color: corn1),
                ),
              ),
              Text(
                item['order']!,
                style: subhead(color: grey800),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          title: 'Order Management',
          onTap: () {},
          action: Image.asset(
            circlesFour,
            width: 24,
            height: 24,
            color: grey1100,
          )),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: radicalRed1),
                color: const Color.fromRGBO(227, 1, 71, 0.2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Refunds Request',
                  style: headline(color: grey1100),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '🛵️ 3 Request refunds',
                        style: subhead(color: grey800),
                      ),
                      SizedBox(
                        height: 32,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Image.asset(
                                  foods[index],
                                  width: 32,
                                  height: 32,
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                            itemCount: foods.length),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Check All Request',
                      onPressed: () {},
                      borderRadius: 24,
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 16),
            child: GradientText(
              'New Orders (108)',
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
          ),
          SizedBox(
            height: height / 4,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) => AnimationClick(
                      child: SizedBox(
                          width: width / 2.2,
                          child: itemPopular(populars[index])),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: populars.length),
          ),
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey1100, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xFFCFE1FD).withOpacity(0.9),
                          const Color(0xFFFFFDE1).withOpacity(0.9),
                        ]),
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(48)),
                    child: Image.asset(
                      chatCircleText,
                      width: 24,
                      height: 24,
                      color: primary,
                    ),
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
                              'Customer Chat',
                              style: headline(color: grey100),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: primary),
                              child: Text(
                                '34 Waiting',
                                style: caption1(color: grey1100),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(avtFemale,
                                    width: 20, height: 20)),
                            const SizedBox(width: 4),
                            Text(
                              'What price?',
                              style: caption1(color: grey400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
