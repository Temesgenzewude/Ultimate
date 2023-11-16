import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../dashboard_full_nopremium/widget/chart.dart';
import '../widget/progress_bar.dart';

final List<String> items = [
  'Weekly',
  'Monthly',
];
final List<Map> goals = [
  <String, dynamic>{
    'icon': house_3d,
    'avatars': [avtMale12, avtMale13, avtMale14],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 56,
    'bg': const Color(0xFF429DF0)
  },
  <String, dynamic>{
    'icon': ic_bus,
    'avatars': [avtMale6, avtMale7, avtMale8],
    'title': 'Travel anywhere',
    'time': '64 days left',
    'available': '\$1,246',
    'total': '\$2,000',
    'percent': 70,
    'bg': green
  }
];

class ChartSaving extends StatefulWidget {
  const ChartSaving({super.key});

  @override
  State<ChartSaving> createState() => _ChartSavingState();
}

class _ChartSavingState extends State<ChartSaving> {
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
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                avtMale12,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: AnimationClick(
            child: Image.asset(
              bellSimple,
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: GradientText(
              'Your Saving',
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  'Yesterday saving: ',
                  style: footnote(color: grey600),
                ),
                Text(
                  '150.000đ',
                  style: footnote(color: grey1100),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: GradientText(
                          'Your Saving',
                          style: const TextStyle(
                              fontSize: 18,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SpaceGrotesk'),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Text(
              'Top Goals',
              style: title4(color: grey1100),
            ),
          ),
          SizedBox(
            height: height / 6,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: goals[index]['bg'],
                          borderRadius: BorderRadius.circular(24)),
                      width: width - 64,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  goals[index]['icon'],
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 32,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, ind) =>
                                          CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  goals[index]['avatars']
                                                      [ind])),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(),
                                      itemCount:
                                          goals[index]['avatars'].length),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                goals[index]['title'],
                                style: callout(color: grey1100),
                              ),
                              Text(
                                '${goals[index]['percent']}%',
                                style: title4(color: grey1100),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: ProgressBar(
                                width: width * goals[index]['percent'] / 100),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    goals[index]['available'],
                                    style: headline(color: grey1100),
                                  ),
                                  Text(
                                    '/' + goals[index]['total'],
                                    style: headline(
                                        color: const Color(0xFFC1D7D7)),
                                  ),
                                ],
                              ),
                              Text(
                                '${goals[index]['time']}',
                                style: subhead(color: grey1100),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                itemCount: goals.length),
          )
        ],
      ),
    );
  }
}
