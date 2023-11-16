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

List<Map<String, dynamic>> transactions = [
  <String, dynamic>{
    'icon': clock,
    'colorIcon': green,
    'title': 'Foody',
    'subTitle': 'December 2, 2018',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'colorIcon': primary,
    'title': 'Shopping',
    'subTitle': 'November 16, 2014',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': clock,
    'title': 'Foody',
    'colorIcon': green,
    'subTitle': 'December 2, 2018',
    'money': '-\$16.48',
    'onTap': () {}
  },
  <String, dynamic>{
    'icon': shoppingBag,
    'title': 'Shopping',
    'colorIcon': primary,
    'subTitle': 'November 16, 2014',
    'money': '-\$16.48',
    'onTap': () {}
  },
];

class Wallet3 extends StatefulWidget {
  const Wallet3({super.key});

  @override
  State<Wallet3> createState() => _Wallet3State();
}

class _Wallet3State extends State<Wallet3> {
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
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: Row(
          children: [
            AnimationClick(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    avtMale,
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GradientText(
              'Welcome back!',
              style: const TextStyle(
                  fontSize: 22,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ],
        ),
        right: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Image.asset(
              icSearch,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  child: AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Image.asset(shield, width: 32, height: 32),
                          ),
                          Text('Own',
                              style: body(color: grey1100.withOpacity(0.5))),
                          Text(
                            '\$1,579.00',
                            style: title3(color: grey1100),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Image.asset(shield, width: 32, height: 32),
                          ),
                          Text('Own',
                              style: body(color: grey1100.withOpacity(0.5))),
                          Text(
                            '\$468.00',
                            style: title3(color: grey1100),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                  color: lightSalmon, borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Expense',
                                    style: callout(
                                        color: grey100, fontWeight: '400'),
                                  ),
                                  const SizedBox(width: 8),
                                  AnimationClick(
                                    child: Image.asset(
                                      icKeyboardRight,
                                      width: 32,
                                      height: 32,
                                      color: grey100,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '\$25,689.43',
                                style: headline(color: primary),
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Expanded(
                          child: DropdownButtonFormField2(
                            value: selectedValue,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: grey1100,
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: grey1100),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: grey1100),
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
                              color: grey1100,
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
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: grey1100, borderRadius: BorderRadius.circular(16)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latest Transaction',
                      style: title3(color: grey100),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 24),
                      itemCount: transactions.length,
                      separatorBuilder: (context, index) => AppWidget.divider(
                          context,
                          color: grey1000.withOpacity(0.5)),
                      itemBuilder: (context, index) => AnimationClick(
                        function: transactions[index]['onTap'],
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: grey1000.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(99)),
                                  child: Image.asset(
                                    transactions[index]['icon'],
                                    width: 24,
                                    height: 24,
                                    color: transactions[index]['colorIcon'],
                                  )),
                              const SizedBox(
                                width: 16,
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
                                          transactions[index]['title'],
                                          style: headline(color: grey100),
                                        ),
                                        Text(
                                          transactions[index]['money'],
                                          style: headline(color: grey100),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      transactions[index]['subTitle'],
                                      style: subhead(
                                          color: grey600, fontWeight: '400'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]))
        ],
      ),
    );
  }
}
