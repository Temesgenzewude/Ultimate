import 'package:flutter/material.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';

List<Map<String, String>> forUser = [
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': hot_dog
  },
  {
    'title': 'Taquito Cheese',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': chicken_bucket
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': french_fries_2
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$2.34',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'image': french_fries_2
  },
];

class ForYou extends StatelessWidget {
  const ForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      scrollDirection: Axis.horizontal,
      itemCount: forUser.length,
      separatorBuilder: (context, index) => const SizedBox(width: 4),
      itemBuilder: (context, index) => AnimationClick(
        child: Stack(
          children: [
            Container(
              width: (width - 48) / 2,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      forUser[index]['image']!,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        forUser[index]['title']!,
                        style: title4(color: grey1100),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'from ',
                              style: subhead(color: corn1),
                            ),
                            Text(
                              forUser[index]['balance']!,
                              style: title4(color: corn1),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            forUser[index]['star']!,
                            style: subhead(color: grey800),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              forUser[index]['distance']!,
                              style: subhead(color: grey800),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                left: 4,
                top: 4,
                child: Image.asset(
                  notification,
                  width: 24,
                  height: 24,
                ))
          ],
        ),
      ),
    );
  }
}
