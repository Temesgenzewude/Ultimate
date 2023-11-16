import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/indicator_widget.dart';

List<Map<String, String>> inStock = [
  {
    'image': french_fries_2,
    'title': 'Ice Cream Jolibee',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'sale': '🛵️ 38 sales',
    'views': '💸️ 48k view',
    'money': '💸️ \$76'
  },
  {
    'image': chicken_bucket,
    'title': 'Taquito Cheese',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'sale': '🛵️ 38 sales',
    'views': '💸️ 48k view',
    'money': '💸️ \$76'
  },
  {
    'image': hot_dog,
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'sale': '🛵️ 38 sales',
    'views': '💸️ 48k view',
    'money': '💸️ \$76'
  },
];

class TopSeller extends StatefulWidget {
  const TopSeller({Key? key}) : super(key: key);

  @override
  State<TopSeller> createState() => _TopSellerState();
}

class _TopSellerState extends State<TopSeller> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText(
                'Top Seller',
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
              IndicatorWidget.createIndicator(
                  lengthImage: inStock.length, currentImage: currentIndex)
            ],
          ),
        ),
        ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => AnimationClick(
                  function: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    decoration: BoxDecoration(
                        color: currentIndex == index ? primary : grey200,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Image.asset(
                          inStock[index]['image']!,
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                inStock[index]['title']!,
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
                                    inStock[index]['balance']!,
                                    style: title4(color: corn1),
                                  ),
                                  Text(
                                    inStock[index]['star']!,
                                    style: subhead(
                                        color: grey800, fontWeight: '400'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    inStock[index]['sale']!,
                                    style: subhead(
                                        color: grey800, fontWeight: '400'),
                                  ),
                                  Text(
                                    inStock[index]['money']!,
                                    style: subhead(
                                        color: grey1100, fontWeight: '400'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 4,
                ),
            itemCount: inStock.length)
      ],
    );
  }
}
