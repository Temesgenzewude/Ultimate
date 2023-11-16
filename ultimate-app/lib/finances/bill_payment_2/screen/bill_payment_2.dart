import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';
import '../../../finances/bill_payment_2/widget/split_bill.dart';
import '../widget/own_bill.dart';

class BillPayment2 extends StatefulWidget {
  const BillPayment2({super.key});

  @override
  State<BillPayment2> createState() => _BillPayment2State();
}

class _BillPayment2State extends State<BillPayment2> {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: height / 3,
                  width: width,
                  decoration: const BoxDecoration(
                      color: primary,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(16))),
                ),
                Positioned(
                  top: 64,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimationClick(
                        function: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          icArrowLeft,
                          width: 24,
                          height: 24,
                          color: grey1100,
                        ),
                      ),
                      AnimationClick(
                        child: Image.asset(
                          circlesFour,
                          width: 24,
                          height: 24,
                          color: grey1100,
                        ),
                      )
                    ],
                  ),
                ),
                IgnorePointer(
                  child: Container(
                    width: width,
                    padding:
                        const EdgeInsets.only(top: 24, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Manage',
                              style: header(color: grey1100),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Billing',
                              style: header(color: grey1100),
                            ),
                          ],
                        ),
                        Expanded(child: Image.asset(fiatMoney1))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 16,
                  right: 16,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 16),
                    child: TextFieldCpn(
                      controller: searchCtl,
                      focusNode: searchFn,
                      hintText: 'Search Bill',
                      filled: true,
                      fillColor: grey200,
                      showPrefixIcon: true,
                      showSuffixIcon: true,
                      suffixIcon: barcode,
                      colorSuffixIcon: grey1100,
                      prefixIcon: icSearch,
                      colorPrefixIcon: grey600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const SplitBill(),
            const SizedBox(
              height: 24,
            ),
            const OwnBill(),
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
