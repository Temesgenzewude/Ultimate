import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/chart.dart';

final List<String> items = [
  'Weekly',
  'Monthly',
];
final List<Map<String, dynamic>> transactions = [
  <String, dynamic>{
    'time': 'Today, December 03',
    'total': '\$32.80',
    'items': [
      <String, dynamic>{
        'title': 'Food & Drink',
        'wallet': 'Cash wallet',
        'money': '\$15.40',
        'time': '10/10/2022 06:27',
        'tag': 'must have',
        'color_tag': primary,
        'icon': icFood
      },
      <String, dynamic>{
        'title': 'Add money',
        'wallet': 'Cash wallet',
        'money': '\$15.40',
        'time': '10/10/2022 06:27',
        'tag': 'want',
        'color_tag': emerald1,
        'icon': icLife
      }
    ]
  },
  <String, dynamic>{
    'time': 'Yesterday, December 02',
    'total': '\$32.80',
    'items': [
      <String, dynamic>{
        'title': 'Add money',
        'wallet': 'Cash wallet',
        'money': '\$15.40',
        'time': '10/10/2022 06:27',
        'tag': 'want',
        'color_tag': emerald1,
        'icon': icLife
      },
      <String, dynamic>{
        'title': 'Food & Drink',
        'wallet': 'Cash wallet',
        'money': '\$15.40',
        'time': '10/10/2022 06:27',
        'tag': 'must have',
        'color_tag': primary,
        'icon': icFood
      }
    ]
  }
];

class DashboardFullNoPremium extends StatefulWidget {
  const DashboardFullNoPremium({super.key});

  @override
  State<DashboardFullNoPremium> createState() => _DashboardFullNoPremiumState();
}

class _DashboardFullNoPremiumState extends State<DashboardFullNoPremium> {
  String? selectedValue = items[0];
  int countColumn = 7;
  List<String> labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<bool> selecteds = [];
  void changeVal(String selectedValue) {
    countColumn = selectedValue == 'Weekly' ? 7 : 12;
    labels = selectedValue == 'Weekly'
        ? ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
        : [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
          ];
    selecteds = List.generate(labels.length, (index) => false);
  }

  @override
  void initState() {
    selecteds = List.generate(labels.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimationClick(
                child: Row(
                  children: [
                    GradientText(
                      'All Wallet',
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
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 24,
                      color: grey800,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$108',
                style: title3(color: grey1100),
              )
            ],
          ),
        ),
        right: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(colors: [
                  const Color(0xFFCFE1FD).withOpacity(0.9),
                  const Color(0xFFFFFDE1).withOpacity(0.9),
                ])),
            child: Text(
              'Give me coffee',
              style: footnote(color: grey100),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField2(
                          value: selectedValue,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: grey200,
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey200),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey200),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: grey500,
                          ),
                          iconSize: 30,
                          buttonHeight: 48,
                          buttonWidth: 94,
                          buttonPadding:
                              const EdgeInsets.only(right: 16, left: 16),
                          dropdownDecoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: body(
                                          color: grey600, fontWeight: '600'),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select occupation.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                              changeVal(selectedValue!);
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              selectedValue = value;
                              changeVal(selectedValue!);
                            });
                          },
                        ),
                      ),
                      const Expanded(flex: 2, child: SizedBox()),
                      Text(
                        '\$145',
                        style: headline(color: grey1100),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Chart(
                  countColumn: countColumn,
                  label: labels,
                  selecteds: selecteds,
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: grey200, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GradientText(
                          transactions[index]['time'],
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
                      ),
                      Text(
                        transactions[index]['total'],
                        style: body(color: corn1),
                      )
                    ],
                  ),
                  AppWidget.divider(context, color: grey300, vertical: 16),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, ind) {
                        final dynamic trans = transactions[index]['items'];
                        return AnimationClick(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(trans[ind]['icon'],
                                  width: 32, height: 32),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      trans[ind]['title'],
                                      style: subhead(color: grey1000),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Image.asset(crownSimple,
                                            width: 16, height: 16),
                                        const SizedBox(width: 8),
                                        Text(
                                          trans[ind]['wallet'],
                                          style: caption1(color: grey600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          color: trans[ind]['color_tag'],
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Text(
                                        trans[ind]['tag'],
                                        style: caption1(color: grey1100),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    trans[ind]['money'],
                                    style: headline(color: grey1000),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    trans[ind]['time'],
                                    style: caption1(color: grey600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, ind) => AppWidget.divider(
                          context,
                          color: grey300,
                          vertical: 16),
                      itemCount: transactions[index]['items'].length),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }
}
