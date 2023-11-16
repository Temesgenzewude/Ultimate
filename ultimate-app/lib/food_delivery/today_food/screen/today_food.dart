import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../tracking_order/widget/button_swipe.dart';

List<Map<String, String>> items = [
  {
    'image': hot_dog,
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5'
  },
  {
    'image': ice_cream,
    'title': 'Ice Cream Jolibee',
    'balance': '\$5.34',
    'star': '⭐️ 4/5'
  },
  {
    'image': french_fries_2,
    'title': 'Fried Chicken Dinne',
    'balance': '\$3.34',
    'star': '⭐️ 3/5'
  },
  {
    'image': hot_dog,
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5'
  },
  {
    'image': ice_cream,
    'title': 'Ice Cream Jolibee',
    'balance': '\$5.34',
    'star': '⭐️ 4/5'
  },
  {
    'image': french_fries_2,
    'title': 'Fried Chicken Dinne',
    'balance': '\$3.34',
    'star': '⭐️ 3/5'
  }
];

class TodayFood extends StatefulWidget {
  const TodayFood({Key? key}) : super(key: key);

  @override
  State<TodayFood> createState() => _TodayFoodState();
}

class _TodayFoodState extends State<TodayFood> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset(
                        map_pin,
                        width: 24,
                        height: 24,
                        color: stPatricksBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '21 Pentrefelin, LL68 9PE',
                    style: headline(color: grey1100),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AnimationClick(
                    child: Image.asset(
                      icKeyboardRight,
                      width: 24,
                      height: 24,
                      color: grey600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: AnimationClick(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              avt_female,
              width: 32,
              height: 32,
            ),
          )),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimationClick(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: grey300, borderRadius: BorderRadius.circular(16)),
              child: Image.asset(
                map_trifold,
                width: 24,
                height: 24,
                color: corn1,
              ),
            ),
          ),
          SizedBox(
            width: width / 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SwipeableButtonView(
                buttonText: 'Roll Again',
                icon: dice_four,
                hasArrow: false,
                buttonWidget: Container(
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                ),
                activeColor: const Color(0xFF009C41),
                isFinished: isFinished,
                onWaitingProcess: () {
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                onFinish: () async {
                  setState(() {
                    isFinished = false;
                  });
                },
              ),
            ),
          ),
          AnimationClick(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: grey1100, borderRadius: BorderRadius.circular(16)),
              child: Image.asset(
                ic_shopping,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        resstaurant_detail_bg,
                        height: height / 3,
                        width: width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: -48,
                      left: 4,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Wisconsin Cheese Curds',
                              style: title3(color: grey1100),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4, bottom: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    globe_simple,
                                    width: 24,
                                    height: 24,
                                    color: grey1100,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '2715 Ash Dr. San Jose, South Dakota 83475',
                                    style: subhead(color: grey900),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '🛵️ 10kms',
                                  style: headline(color: grey1100),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    '⭐️ 4/5',
                                    style: headline(color: grey1100),
                                  ),
                                ),
                                Text(
                                  '⏰️ 15-20 minitues',
                                  style: headline(color: grey1100),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 64),
                  itemBuilder: (context, index) {
                    return AnimationClick(
                      function: () {},
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: grey200,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              items[index]['image']!,
                              width: 56,
                              height: 56,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    items[index]['title']!,
                                    style: headline(color: grey1100),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        items[index]['balance']!,
                                        style: title4(color: corn1),
                                      ),
                                      Text(
                                        items[index]['star']!,
                                        style: subhead(color: grey800),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4),
                  itemCount: items.length),
              const SizedBox(height: 32)
            ],
          ),
          Positioned(
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                height: height / 4,
                width: width,
                decoration: BoxDecoration(
                    gradient: Theme.of(context).colorLinearBottom2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
