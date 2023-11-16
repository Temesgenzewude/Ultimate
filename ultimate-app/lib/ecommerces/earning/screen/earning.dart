import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/chart_earning.dart';

List<Map<String, dynamic>> static = [
  <String, dynamic>{'icon': order, 'title': 'Pending Order', 'subTitle': '268'},
  <String, dynamic>{'icon': truck, 'title': 'Shipping', 'subTitle': '57'},
  <String, dynamic>{'icon': package, 'title': 'Refund', 'subTitle': '268'},
  <String, dynamic>{'icon': star_earning, 'title': 'Rating', 'subTitle': '57'},
];

class Earning extends StatefulWidget {
  const Earning({Key? key}) : super(key: key);

  @override
  State<Earning> createState() => _EarningState();
}

class _EarningState extends State<Earning> {
  Widget item(String icon, String title, String subTitle) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: grey200, borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(icon, width: 48, height: 48),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: body(color: grey1100),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                subTitle,
                style: title4(color: grey1100),
              ),
            ],
          )
        ],
      ),
    );
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
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Earning',
              style: header(color: grey1100),
            ),
          ),
          const ChartEarning(),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 24, bottom: 16),
            child: GradientText(
              'Analytics',
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4),
            itemCount: static.length,
            itemBuilder: (context, index) => AnimationClick(
              child: item(static[index]['icon']!, static[index]['title']!,
                  static[index]['subTitle']),
            ),
          ),
        ],
      ),
    );
  }
}
