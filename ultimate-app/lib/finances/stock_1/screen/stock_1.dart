import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';
import '../../../finances/stock_1/widget/button_action.dart';
import '../../../finances/stock_1/widget/chart_coin.dart';
import '../../invest_1/widget/chart_detail.dart';

class Stock1 extends StatefulWidget {
  const Stock1({super.key});

  @override
  State<Stock1> createState() => _Stock1State();
}

class _Stock1State extends State<Stock1> {
  int selectedSort = 0;
  List<String> sortStrings = ['1M', '3M', '6M', '1Y', 'ALL'];
  TextEditingController priceCtl = TextEditingController();
  FocusNode priceFn = FocusNode();
  TextEditingController amountCtl = TextEditingController();
  FocusNode amountFn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return UnfocusClick(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppWidget.createSimpleAppBar(
            context: context,
            hasLeading: true,
            hasPop: true,
            action: Image.asset(
              icSearch,
              width: 24,
              height: 24,
              color: grey1100,
            ),
            onTap: () {}),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'ABC',
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
                    Text(
                      'Abc joint stock company',
                      style: body(color: grey800),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '\$12,860.44',
                          style: title2(color: grey1100),
                        ),
                        AnimationClick(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '+\$42.8 (0.5%) today',
                                  style: footnote(
                                      color: grey1100, fontWeight: '600'),
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
                        )
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Column(
                        children: [
                          const Expanded(child: ChartCoin()),
                          Container(
                            margin: const EdgeInsets.only(top: 24),
                            decoration: BoxDecoration(
                                color: grey200,
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  sortStrings.length + 1,
                                  (i) => i == sortStrings.length
                                      ? AnimationClick(
                                          child: Image.asset(
                                            arrowsOutSimple,
                                            width: 20,
                                            height: 20,
                                            color: grey600,
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSort = i;
                                            });
                                          },
                                          child: chartSortWidget(
                                              sortStrings[i],
                                              selectedSort == i
                                                  ? true
                                                  : false))),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    color: grey200,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldCpn(
                            labelText: 'Price',
                            hintText: 'Input price',
                            labelStyle: callout(color: grey600),
                            controller: priceCtl,
                            focusNode: priceFn,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            fillColor: grey200,
                            borderColor: grey300,
                            filled: true,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextFieldCpn(
                            labelText: 'Amount',
                            hintText: 'Input amount',
                            labelStyle: callout(color: grey600),
                            labelRight: AnimationClick(
                              child: Text(
                                'MAX',
                                style: headline(color: corn1),
                              ),
                            ),
                            controller: amountCtl,
                            focusNode: amountFn,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            fillColor: grey200,
                            borderColor: grey300,
                            filled: true,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: buttonAction(
                                context: context,
                                input1: 'Buy',
                                input2: '-\$12,468.00',
                                bgColor: radicalRed1,
                                borderColor: radicalRed1,
                                textColor: grey1100,
                                borderRadius: 16,
                                onPressed: () {})),
                        const SizedBox(width: 8),
                        Expanded(
                            child: buttonAction(
                                context: context,
                                input1: 'Sale',
                                input2: '+\$12,468.00',
                                bgColor: primary,
                                borderColor: primary,
                                textColor: grey1100,
                                borderRadius: 16,
                                onPressed: () {}))
                      ],
                    ),
                    const SizedBox(height: 8)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
