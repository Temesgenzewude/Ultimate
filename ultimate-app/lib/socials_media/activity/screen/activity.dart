import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../widget/item.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'avt': avtFemale,
    'name': 'Albert Flores',
    'subTitle': 'Top 10 coach finance',
    'subItems': [
      {
        'image': imageActivity1,
        'avt': avtMale3,
        'name': 'Brooklyn Simmons',
        'subTitle': '15k Follow',
      },
      {
        'image': imageActivity1,
        'avt': avtMale2,
        'name': 'Brooklyn Simmons',
        'subTitle': '15k Follow',
      },
      {
        'image': imageActivity1,
        'avt': avtMale,
        'name': 'Brooklyn Simmons',
        'subTitle': '15k Follow',
      }
    ]
  },
  <String, dynamic>{
    'avt': avtMale5,
    'name': 'Jane Cooper',
    'subTitle':
        'In what situations may I be barred from trading Event Contracts?',
    'subItems': [
      {
        'image': imageActivity1,
        'avt': avtMale3,
        'name': 'Brooklyn Simmons',
        'subTitle': '15k Follow',
      },
      {
        'image': imageActivity1,
        'avt': avtMale4,
        'name': 'Brooklyn Simmons',
        'subTitle': '15k Follow',
      },
      {
        'image': imageActivity1,
        'avt': avtMale2,
        'name': 'Brooklyn Simmons',
        'subTitle': '15k Follow',
      }
    ]
  }
];

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              article,
              width: 28,
              height: 28,
            ),
          ),
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  notification,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: Container(
                    height: 6,
                    width: 6,
                    margin: const EdgeInsets.only(bottom: 4),
                    decoration: BoxDecoration(
                        color: grey1100,
                        borderRadius: BorderRadius.circular(24)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Activity',
              style: title2(color: grey1100),
            ),
          ),
          AnimationClick(
            child: Container(
              width: width,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(
                  left: 16, bottom: 24, right: 16, top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: [
                  const Color(0xFFCFE1FD).withOpacity(0.9),
                  const Color(0xFFFFFDE1).withOpacity(0.9),
                ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Send Request',
                          style: title4(color: grey100),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '13 peoples',
                          style: subhead(color: grey400),
                        ),
                      ],
                    ),
                  ),
                  AnimationClick(
                      child: Image.asset(
                    icArrowRight,
                    width: 24,
                    height: 24,
                    color: primary,
                  ))
                ],
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimationClick(child: ItemActivity(item: items[index]));
              },
              separatorBuilder: (context, index) => const SizedBox(height: 32),
              itemCount: items.length)
        ],
      ),
    );
  }
}
