import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> items = [
  {
    'image': chicken_bucket,
    'title': 'Panera Mac and Cheese',
    'balance': '\$5.22',
    'origin': '\$13.68',
    'subTitle': 'Ciate Palemore Lipstick Bold Red Color'
  },
  {
    'image': french_fries_2,
    'title': 'Ice Cream Jolibee',
    'balance': '\$3.12',
    'origin': '\$6.68',
    'subTitle': 'Ciate Palemore Lipstick Bold Red Color'
  },
  {
    'image': hot_dog,
    'title': 'Chalupa Supreme',
    'balance': '\$6.22',
    'origin': '\$15.68',
    'subTitle': 'Ciate Palemore Lipstick Bold Red Color'
  }
];

class CardProduct extends StatefulWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  int selected = 1;

  Widget item(
      Map<String, String> item, double height, double width, bool isCenter) {
    return Container(
        height: isCenter ? height : height - 120,
        width: isCenter ? width : width - 160,
        margin: const EdgeInsets.all(48),
        decoration: BoxDecoration(
            color: isCenter ? grey200 : grey300,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                item['image']!,
              ),
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  item['title']!,
                  style: title2(color: grey1100),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['balance']!,
                        style: title4(color: corn1),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        item['origin']!,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: grey600,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  item['subTitle']!,
                  style: body(color: grey1100),
                ),
              ],
            ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        right: Row(
          children: [
            AnimationClick(
              child: Image.asset(
                bellSimple,
                width: 24,
                height: 24,
                color: corn1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimationClick(
                child: Image.asset(
                  dotsThreeVertical,
                  width: 24,
                  height: 24,
                  color: corn1,
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'Items you',
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
                    const SizedBox(height: 8),
                    GradientText(
                      'Want?',
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
                  ],
                )),
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(48)),
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
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: [
              LayoutBuilder(builder: (context, size) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: List.generate(
                      items.length,
                      (index) => index == 2
                          ? Transform.rotate(
                              angle: 0,
                              child: AnimationClick(
                                child: item(items[selected], size.maxHeight,
                                    size.maxWidth, true),
                              ),
                            )
                          : Positioned(
                              right:
                                  selected < items.length - 1 && index % 2 == 0
                                      ? -10
                                      : null,
                              left: selected > 0 && index % 2 != 0 ? -10 : null,
                              bottom: 10,
                              child: Transform.rotate(
                                angle: index == 0 ? -3.096 : 3.096,
                                child: Container(
                                  height: size.maxHeight - 120,
                                  width: size.maxWidth - 160,
                                  margin: const EdgeInsets.all(48),
                                  decoration: BoxDecoration(
                                      color: grey300,
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                            )),
                );
              }),
              Positioned(
                  left: 8,
                  child: AnimationClick(
                    function: () {
                      setState(() {
                        if (selected >= 1) {
                          selected -= 1;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset(
                        icArrowLeft,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      ),
                    ),
                  )),
              Positioned(
                  right: 8,
                  child: AnimationClick(
                    function: () {
                      setState(() {
                        if (selected < items.length - 1) {
                          selected += 1;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: grey600,
                          borderRadius: BorderRadius.circular(16)),
                      child: Image.asset(
                        icArrowRight,
                        width: 24,
                        height: 24,
                        color: grey100,
                      ),
                    ),
                  ))
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            child: Row(
              children: [
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: grey200,
                        borderRadius: BorderRadius.circular(16)),
                    child: Image.asset(
                      heart2,
                      width: 20,
                      height: 20,
                      color: grey1100,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: AppWidget.typeButtonStartAction(
                        context: context,
                        input: 'Buy Now',
                        borderColor: primary,
                        onPressed: () {},
                        bgColor: primary,
                        textColor: grey1100),
                  ),
                ),
                AnimationClick(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: grey200,
                        borderRadius: BorderRadius.circular(16)),
                    child: Image.asset(
                      shopping_cart_simple,
                      width: 20,
                      color: grey1100,
                      height: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
