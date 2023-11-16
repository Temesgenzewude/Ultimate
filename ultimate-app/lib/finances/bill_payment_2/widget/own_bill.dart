import 'package:flutter/cupertino.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, String>> items = [
  {
    'title': 'Shopping',
    'icon': icShopping,
    'balance': '\$5,680.00',
    'due': '20/12/2025',
    'status': 'Waiting'
  },
  {
    'title': 'Water',
    'icon': icLife,
    'balance': '\$5,680.00',
    'due': '20/12/2025',
    'status': 'Paid'
  },
  {
    'title': 'Food & Drink',
    'icon': icFood,
    'balance': '\$5,680.00',
    'due': '20/12/2025',
    'status': 'Expired'
  },
  {
    'title': 'Shopping',
    'icon': icShopping,
    'balance': '\$5,680.00',
    'due': '20/12/2025',
    'status': 'Waiting'
  },
];

class OwnBill extends StatelessWidget {
  const OwnBill({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GradientText(
            'Own Bill',
            style: const TextStyle(
                fontSize: 24,
                height: 1,
                fontWeight: FontWeight.w700,
                fontFamily: 'SpaceGrotesk'),
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
        ),
        SizedBox(
          height: height / 4,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) => AnimationClick(
              child: Container(
                width: width - 24,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          items[index]['icon']!,
                          width: 48,
                          height: 48,
                        ),
                        const SizedBox(width: 16),
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
                                    style: title4(color: grey1100),
                                  ),
                                  AnimationClick(
                                    child: Image.asset(
                                      dotsThreeVertical,
                                      width: 24,
                                      height: 24,
                                      color: grey1100,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                items[index]['balance']!,
                                style: title2(color: grey1100),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: AppWidget.divider(context,
                          vertical: 16, color: grey1100.withOpacity(0.1)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Due: ${items[index]['due']}',
                          style: body(color: grey1100.withOpacity(0.5)),
                        ),
                        AnimationClick(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: items[index]['status']! == 'Waiting'
                                    ? corn1
                                    : items[index]['status']! == 'Paid'
                                        ? emerald1
                                        : radicalRed1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            child: Text(
                              items[index]['status']!,
                              style: headline(
                                  color: items[index]['status']! == 'Waiting'
                                      ? grey100
                                      : grey1100),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
