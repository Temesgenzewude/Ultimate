import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/indicator_widget.dart';
import '../widget/top_seller.dart';

List<Map<String, dynamic>> static = [
  <String, dynamic>{'icon': order, 'title': 'Pending Order', 'subTitle': '268'},
  <String, dynamic>{'icon': truck, 'title': 'Shipping', 'subTitle': '57'},
  <String, dynamic>{'icon': package, 'title': 'Refund', 'subTitle': '268'},
  <String, dynamic>{'icon': star_earning, 'title': 'Rating', 'subTitle': '57'},
];

class PaymentProcessing extends StatefulWidget {
  const PaymentProcessing({Key? key}) : super(key: key);

  @override
  State<PaymentProcessing> createState() => _PaymentProcessingState();
}

class _PaymentProcessingState extends State<PaymentProcessing> {
  int currentIndex = 0;
  Widget item(String icon, String title, String subTitle, bool selected) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: selected ? primary : grey200,
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(icon, width: 40, height: 40),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  style: body(color: grey1100),
                ),
              ],
            ),
          ),
          Text(
            subTitle,
            style: title4(color: grey1100),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: Image.asset(
                    avtFemale,
                    width: 48,
                    height: 48,
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
                            fontSize: 20,
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
                            style: subhead(color: grey800),
                          ),
                          const SizedBox(width: 8),
                          AnimationClick(
                              child: Image.asset(
                            copy,
                            width: 16,
                            height: 16,
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
          Container(
            margin: const EdgeInsets.only(top: 24, left: 4, right: 4),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '\$230K',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Balance',
                      style: subhead(color: grey800, fontWeight: '400'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '2,468',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Sales',
                      style: subhead(color: grey800, fontWeight: '400'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '498',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Product',
                      style: subhead(color: grey800, fontWeight: '400'),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Sumary',
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
                    lengthImage: static.length, currentImage: currentIndex)
              ],
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) => AnimationClick(
                      function: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: SizedBox(
                        width: (width - 48) / 2,
                        child: item(
                            static[index]['icon']!,
                            static[index]['title']!,
                            static[index]['subTitle'],
                            currentIndex == index),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemCount: static.length),
          ),
          const TopSeller()
        ],
      ),
    );
  }
}
