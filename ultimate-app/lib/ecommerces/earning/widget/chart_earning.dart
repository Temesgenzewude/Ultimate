import 'dart:math';

import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../list_product/widget/column_chart.dart';

List<String> monthly = [
  'Jan 2023',
  'Feb 2023',
  'Mar 2023',
  'Apr 2023',
  'May 2023',
  'Jun 2023',
  'Jul 2023',
  'Aug 2023',
  'Sep 2023',
  'Oct 2023',
  'Nov 2023',
  'Dec 2023'
];
List<String> daily = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
List<String> yearly = ['2020', '2021', '2022', '2023', '2024'];

class ChartEarning extends StatefulWidget {
  const ChartEarning({super.key});

  @override
  State<ChartEarning> createState() => _ChartEarningState();
}

class _ChartEarningState extends State<ChartEarning> {
  int countColumn = 7;
  int selected = 0;
  int selectedTime = 0;
  List<bool> selecteds = [];
  List<String> labels = daily;
  List<String> tabs = ['Daily', 'Monthly', 'Yearly'];
  @override
  void initState() {
    selecteds = List.generate(labels.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SizedBox(
          height: 48,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, index) {
                return AnimationClick(
                  function: () {
                    setState(() {
                      selected = index;
                      countColumn = selected == 0
                          ? 7
                          : selected == 1
                              ? 12
                              : 5;
                      labels = selected == 0
                          ? daily
                          : selected == 1
                              ? monthly
                              : yearly;
                      selecteds =
                          List.generate(labels.length, (index) => false);
                    });
                  },
                  child: Container(
                    width: (width - 24) / 3,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: selected == index ? primary : grey200),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: headline(
                            color: selected == index ? grey1100 : grey600),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 4,
                  ),
              itemCount: tabs.length),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimationClick(
                        function: () {
                          setState(() {
                            for (int i = 0; i < selecteds.length; i++) {
                              selecteds[i] = false;
                            }
                            selectedTime = selectedTime >= 1
                                ? selectedTime - 1
                                : selectedTime;
                            selecteds[selectedTime] = true;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 28,
                          color: grey1100,
                        )),
                    Text(
                      labels[selectedTime],
                      style: headline(color: grey1100),
                    ),
                    AnimationClick(
                        function: () {
                          setState(() {
                            for (int i = 0; i < selecteds.length; i++) {
                              selecteds[i] = false;
                            }
                            selectedTime = selectedTime < selecteds.length - 1
                                ? selectedTime + 1
                                : selectedTime;
                            selecteds[selectedTime] = true;
                          });
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 28,
                          color: grey1100,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 120,
                decoration: const BoxDecoration(color: primary),
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemCount: countColumn,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 6,
                            );
                          },
                          itemBuilder: (context, index) {
                            return AnimationClick(
                              function: () {
                                setState(() {
                                  for (int i = 0; i < selecteds.length; i++) {
                                    selecteds[i] = false;
                                  }
                                  selectedTime = index;
                                  selecteds[index] = true;
                                });
                              },
                              child: ColumnChart(
                                selected: selecteds[index],
                                height: Random().nextDouble() * 100,
                                title: labels[index],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: headline(color: grey1100),
                        ),
                        Text(
                          '\$862.34',
                          style: title4(color: corn1),
                        )
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Average per day',
                          style: headline(color: grey800),
                        ),
                        Text(
                          '\$62.34',
                          style: title4(color: grey800),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
