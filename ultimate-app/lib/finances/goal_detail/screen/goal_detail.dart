import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../chart_saving/widget/progress_bar.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'avt': avtMale11,
    'title': 'Add money',
    'time': '10/10/2022 06:27',
    'money': '\$15.40',
    'premium': true,
  },
  <String, dynamic>{
    'avt': avtMale12,
    'title': 'Add money',
    'time': '10/10/2022 06:27',
    'money': '\$15.40',
    'premium': false,
  },
  <String, dynamic>{
    'avt': avtMale13,
    'title': 'Add money',
    'time': '10/10/2022 06:27',
    'money': '\$15.40',
    'premium': false,
  },
  <String, dynamic>{
    'avt': avtMale14,
    'title': 'Add money',
    'time': '10/10/2022 06:27',
    'money': '\$15.40',
    'premium': false,
  },
  <String, dynamic>{
    'avt': avtMale9,
    'title': 'Add money',
    'time': '10/10/2022 06:27',
    'money': '\$15.40',
    'premium': false,
  }
];

List<Map<String, dynamic>> members = [
  <String, dynamic>{
    'avt': avtMale2,
    'name': 'Cameron William',
    'percent': 0.3,
    'money': '\$5,680.00'
  },
  <String, dynamic>{
    'avt': avtMale3,
    'name': 'Christine Stewart',
    'percent': 0.4,
    'money': '\$5,680.00'
  },
  <String, dynamic>{
    'avt': avtMale4,
    'name': 'Cameron William',
    'percent': 0.5,
    'money': '\$5,680.00'
  },
  <String, dynamic>{
    'avt': avtMale5,
    'name': 'Cameron William',
    'percent': 0.6,
    'money': '\$5,680.00'
  },
  <String, dynamic>{
    'avt': avtMale6,
    'name': 'Cameron William',
    'percent': 0.7,
    'money': '\$5,680.00'
  },
  <String, dynamic>{
    'avt': avtMale7,
    'name': 'Cameron William',
    'percent': 0.8,
    'money': '\$5,680.00'
  },
];

class GoalDetail extends StatelessWidget {
  const GoalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBarCpn(
        left: AnimationClick(
          function: () {
            Navigator.of(context).pop();
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              Icons.arrow_back,
              size: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'Buy house',
          style: headline(color: grey1100),
        ),
        right: AnimationClick(
          function: () {},
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              ic_edit,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: AppWidget.typeButtonStartAction(
            context: context,
            input: 'Add money',
            onPressed: () {},
            bgColor: const Color(0xff5784E8),
            borderColor: const Color(0xff5784E8),
            textColor: grey1100),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(location, width: 32, height: 32),
                    Text(
                      '15%',
                      style: title4(color: grey1100),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ProgressBar(width: width * 0.3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$5,680.00',
                          style: headline(color: grey1100),
                        ),
                        Text(
                          '/\$23,468.00',
                          style: headline(color: const Color(0xFFC1D7D7)),
                        ),
                      ],
                    ),
                    Text(
                      '64 days left',
                      style: body(color: grey1100),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: grey100,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24))),
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Member (4)',
                          style: title4(color: grey1100),
                        ),
                        Row(
                          children: [
                            AnimationClick(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  children: [
                                    Text(
                                      'Invite',
                                      style: caption1(color: grey1100),
                                    ),
                                    const SizedBox(width: 4),
                                    Image.asset(
                                      user_plus,
                                      width: 16,
                                      height: 16,
                                      color: grey1100,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const AnimationClick(
                                child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 28,
                              color: primary,
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 5,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      itemCount: members.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemBuilder: (context, index) => AnimationClick(
                        child: Container(
                          width: width / 3,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: grey200,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      members[index]['avt']!,
                                      width: 32,
                                      height: 32,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xFF5784E8)),
                                      child: Text(
                                        '${members[index]['percent'] * 100}%',
                                        style: caption1(color: grey1100),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                members[index]['name']!,
                                style: headline(color: grey1100),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ProgressBar(
                                  width:
                                      (width / 3) * members[index]['percent']),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                members[index]['money']!,
                                style: caption1(color: grey800),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction History',
                          style: title4(color: grey1100),
                        ),
                        const AnimationClick(
                            child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 28,
                          color: primary,
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 24),
                    itemBuilder: (context, index) => AnimationClick(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(items[index]['avt']!),
                            radius: 32,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      items[index]['title']!,
                                      style: callout(color: grey1000),
                                    ),
                                    Text(
                                      items[index]['money']!,
                                      style: headline(color: grey1100),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  items[index]['time']!,
                                  style: caption1(
                                      color: grey1100.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
