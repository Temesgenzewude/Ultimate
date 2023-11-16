import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/chart_detail.dart';

class Invest1 extends StatefulWidget {
  const Invest1({super.key});

  @override
  State<Invest1> createState() => _Invest1State();
}

class _Invest1State extends State<Invest1> {
  int selectedSort = 0;
  List<String> sortStrings = ['1M', '3M', '6M', '1Y', 'ALL'];
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                avtMale,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      bellSimple,
                      width: 24,
                      height: 24,
                      color: grey1100,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 6,
                        width: 6,
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                            color: corn1,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GradientText(
              'Investment',
              style: const TextStyle(
                  fontSize: 32,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              '\$12,860.44',
              style: header(color: grey1100),
            ),
          ),
          Row(
            children: [
              AnimationClick(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+\$42.8 All time',
                        style: footnote(color: grey1100, fontWeight: '600'),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        arrowUpRight,
                        width: 24,
                        height: 24,
                        color: grey1100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: grey100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SizedBox(
                    height: height / 3,
                    child: LineChart(
                      chart(false, spots, 21619.37, 22165.06, 0, 48.0, context),
                    )),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        sortStrings.length,
                        (i) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSort = i;
                              });
                            },
                            child: chartSortWidget(sortStrings[i],
                                selectedSort == i ? true : false))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Investment',
                  style: const TextStyle(
                      fontSize: 32,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
                AnimationClick(
                  child: Image.asset(
                    icArrowRight,
                    width: 24,
                    height: 24,
                    color: grey1100,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height / 4.5,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => AnimationClick(
                child: Container(
                  width: width - 48,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: grey200, borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: items[index]['bg'],
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset(
                                  items[index]['icon']!,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                items[index]['title']!,
                                style: title4(color: grey1100),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: primary),
                            child: Text(
                              items[index]['rate'],
                              style: callout(color: grey1100),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: AppWidget.divider(context,
                              color: grey300, vertical: 0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Balance',
                                style: subhead(color: grey600),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${items[index]['balance']}',
                                style: headline(color: grey1100),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Profits',
                                style: subhead(color: grey600),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${items[index]['profits']}',
                                style: callout(color: grey1100),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
