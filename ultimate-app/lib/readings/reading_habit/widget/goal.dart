import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/progress_bar.dart';

List<String> items = [
  'Weekly',
  'Monthly',
];

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  String? selectedValue = items[0];
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return AnimationClick(
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: lightSalmon, borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'GOAL',
                    style: title3(color: grey100),
                  ),
                ),
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
                    buttonPadding: const EdgeInsets.only(right: 16, left: 16),
                    dropdownDecoration: BoxDecoration(
                      color: grey1100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: body(color: grey600, fontWeight: '600'),
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
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: ProgressBar(width: width * 0.6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Keep read continue',
                  style: subhead(color: grey100),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '200/',
                    style: subhead(color: grey100, fontWeight: '700'),
                    children: <TextSpan>[
                      TextSpan(
                        text: '300 ',
                        style: subhead(color: grey600),
                      ),
                      TextSpan(
                        text: 'Mins',
                        style: subhead(color: grey100, fontWeight: '700'),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
