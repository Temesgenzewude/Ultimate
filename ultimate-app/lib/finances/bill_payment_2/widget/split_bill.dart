import 'package:flutter/cupertino.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import 'progress_bar.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'title': 'Water',
    'icon': icLife,
    'paid': '\$128.00',
    'total': '\$680.00',
    'paid_person': 1,
    'total_person': 4,
  },
  <String, dynamic>{
    'title': 'Entertainment',
    'icon': icEntertainment,
    'paid': '\$340.00',
    'total': '\$680.00',
    'paid_person': 2,
    'total_person': 4,
  },
];

class SplitBill extends StatelessWidget {
  const SplitBill({super.key});

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
            'Split Bill',
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
                width: width - 48,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              items[index]['icon']!,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              items[index]['title']!,
                              style: title4(color: grey1100),
                            ),
                          ],
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
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          items[index]['paid'],
                          style: body(color: grey600),
                        ),
                        Text(
                          items[index]['total'],
                          style: title4(color: grey1100),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ProgressBar(
                        width: width *
                            items[index]['paid_person'] /
                            items[index]['total_person']),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${items[index]['paid_person']} of ${items[index]['total_person']} Paid',
                          style: headline(color: lightSalmon.withOpacity(0.7)),
                        ),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          height: 24,
                          child: ListView.separated(
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                avtMale,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            shrinkWrap: true,
                            itemCount: items[index]['total_person'],
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 4),
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
