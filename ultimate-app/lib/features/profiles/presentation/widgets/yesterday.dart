import 'package:flutter/material.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';

List<Map<String, String>> items = [
  {
    'title': 'Crispy Chicken',
    'balance': '\$14.81',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_5
  },
  {
    'title': 'French Fries',
    'balance': '\$6.48',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_2
  },
  {
    'title': 'Chalupa Supreme',
    'balance': '\$5.22',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_3
  },
  {
    'title': 'Kung Pao Chicken',
    'balance': '\$8.99',
    'star': '⭐️ 4/5',
    'distance': '🛵️ 10kms',
    'time': '⏰️ 15 mins',
    'image': image_food_4
  },
];

class Yesterday extends StatelessWidget {
  const Yesterday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) => AnimationClick(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: grey300, borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(items[index]['image']!,
                            width: 80, height: 80),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              items[index]['title']!,
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
                                    items[index]['balance']!,
                                    style: title4(color: corn1),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  items[index]['star']!,
                                  style: subhead(
                                      color: grey1100, fontWeight: '400'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Text(
                                    items[index]['distance']!,
                                    style: subhead(
                                        color: grey1100, fontWeight: '400'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppWidget.divider(context, vertical: 16, color: grey400),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            AnimationClick(
                              child: Row(
                                children: [
                                  Image.asset(
                                    hand_pointing,
                                    width: 16,
                                    height: 16,
                                    color: grey1100,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '12k',
                                    style: subhead(color: grey1100),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: AnimationClick(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      chats_circle,
                                      width: 16,
                                      height: 16,
                                      color: grey1100,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '234',
                                      style: subhead(color: grey1100),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Book Again',
                            vertical: 12,
                            borderColor: primary,
                            borderRadius: 16,
                            onPressed: () {},
                            bgColor: primary,
                            textColor: grey1100),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                right: 8,
                top: 8,
                child: AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(24)),
                    child: Image.asset(
                      attachment,
                      width: 16,
                      height: 16,
                      color: grey1100,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
