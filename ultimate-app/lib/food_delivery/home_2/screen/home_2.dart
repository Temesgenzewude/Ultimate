import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> populars = [
  {
    'image': chicken_bucket,
    'title': 'Ice Cream Jolibee',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms'
  },
  {
    'image': french_fries_2,
    'title': 'Ice Cream Jolibee',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms'
  },
  {
    'image': ramen,
    'title': 'Ramen Japan',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms'
  },
];

List<Map<String, String>> restaurants = [
  {
    'image': resstaurant_detail_bg,
    'title': 'Pizza Hut - Kim Ma Thuong',
    'location': '212 - Kim Ma Thuong - Ba Dinh - Ha Noi',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms'
  },
  {
    'image': home_food_1,
    'title': 'Pizza Hut - Kim Ma Thuong',
    'location': '212 - Kim Ma Thuong - Ba Dinh - Ha Noi',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms'
  },
];

class Home2 extends StatelessWidget {
  const Home2({Key? key}) : super(key: key);
  Widget itemPopular(Map<String, String> item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(item['image']!)),
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
                  item['balance']!,
                  style: title4(color: corn1),
                ),
              ),
              Row(
                children: [
                  Text(
                    item['star']!,
                    style: subhead(color: grey800),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    item['distance']!,
                    style: subhead(color: grey800),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget itemRestaurant(Map<String, String> item, double width) {
    return Container(
      width: width - 64,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item['image']!,
                    width: width - 64,
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['title']!,
                style: title4(color: grey1100),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    Image.asset(
                      globe_simple,
                      width: 16,
                      height: 16,
                      color: grey600,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item['location']!,
                      style: subhead(color: grey600),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    item['distance']!,
                    style: subhead(color: grey800),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    item['star']!,
                    style: subhead(color: grey800),
                  )
                ],
              )
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: AnimationClick(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 64),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: stPatricksBlue,
                    borderRadius: BorderRadius.circular(99)),
                child: Image.asset(ic_shopping, width: 36, height: 36),
              ),
              Positioned(
                  right: 4,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      '3',
                      style: subhead(color: grey1100),
                    ),
                  ))
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.only(left: 4, right: 4, top: 64),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery to',
                        style: caption1(color: grey900),
                      ),
                      Row(
                        children: [
                          AnimationClick(
                            child: Image.asset(
                              icSearch,
                              width: 24,
                              height: 24,
                              color: grey1100,
                            ),
                          ),
                          const SizedBox(width: 16),
                          AnimationClick(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.asset(
                                  avt_female,
                                  width: 24,
                                  height: 24,
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AnimationClick(
                    child: Row(
                      children: [
                        Text(
                          '21 Pentrefelin, LL68 9PE',
                          style: headline(color: grey1100),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          icKeyboardRight,
                          width: 24,
                          height: 24,
                          color: grey600,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: AnimationClick(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  home_food_1,
                  width: width,
                  height: height / 6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '☕️',
                        style: title2(context: context),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GradientText(
                      'Popular',
                      style: const TextStyle(
                          fontSize: 28,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    )
                  ],
                ),
                AnimationClick(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'See more',
                      style: headline(color: grey1100),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 4,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => AnimationClick(
                      child: SizedBox(
                          width: width / 2.2,
                          child: itemPopular(populars[index])),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: populars.length),
          ),
          Container(
            decoration: BoxDecoration(
                color: green, borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            margin:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '326 Vourcher waiting',
                    style: callout(color: grey1100),
                  ),
                ),
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(24)),
                    child: Text(
                      'Claim',
                      style: headline(color: grey1100),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Restaurant',
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
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: grey200,
                        borderRadius: BorderRadius.circular(24)),
                    child: Image.asset(
                      icArrowRight,
                      width: 24,
                      height: 24,
                      color: corn1,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: height / 3,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => AnimationClick(
                      child: itemRestaurant(restaurants[index], width),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: restaurants.length),
          ),
          const SizedBox(height: 84),
        ],
      ),
    );
  }
}
