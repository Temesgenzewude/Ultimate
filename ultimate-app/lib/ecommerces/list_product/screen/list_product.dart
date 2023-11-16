import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../widget/chart.dart';
import '../widget/tab_view.dart';

final List<String> items = [
  'Weekly',
  'Monthly',
];

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  bool showBalance = false;

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
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(
              chatCircleDots,
              width: 24,
              height: 24,
              color: grey1100,
            ),
          ),
        ),
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
        padding: const EdgeInsets.only(bottom: 64),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GradientText(
              'Dashboard',
              style: const TextStyle(
                  fontSize: 42,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
          ),
          AnimationClick(
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ])),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '36 Order Pending',
                      style: title4(color: grey100),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: primary),
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
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Profits',
                                  style:
                                      body(color: grey800, fontWeight: '500'),
                                ),
                                const SizedBox(width: 8),
                                AnimationClick(
                                  function: () {
                                    setState(() {
                                      showBalance = !showBalance;
                                    });
                                  },
                                  child: Image.asset(
                                    showBalance ? eye : eyeSlash,
                                    width: 20,
                                    height: 20,
                                    color: grey800,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              showBalance ? '\$25,689.43' : '******',
                              style: title4(color: grey1100),
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
                            fillColor: primary,
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey1100),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: grey1100),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          isExpanded: true,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: grey1100,
                          ),
                          iconSize: 30,
                          buttonHeight: 48,
                          buttonWidth: 94,
                          buttonPadding:
                              const EdgeInsets.only(right: 16, left: 16),
                          dropdownDecoration: BoxDecoration(
                            color: grey300,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: body(
                                          color: grey1100, fontWeight: '600'),
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
          const SizedBox(height: 24),
          const TabView()
        ],
      ),
    );
  }
}
