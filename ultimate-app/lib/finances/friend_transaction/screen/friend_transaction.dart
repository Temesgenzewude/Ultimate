import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../widget/progress_bar.dart';

List<Map<String, String>> items = [
  {'title': 'Add money', 'time': '10/10/2022 06:27', 'money': '\$15.40'},
  {'title': 'Add money', 'time': '10/10/2022 06:27', 'money': '\$15.40'},
  {'title': 'Add money', 'time': '10/10/2022 06:27', 'money': '\$15.40'},
  {'title': 'Add money', 'time': '10/10/2022 06:27', 'money': '\$15.40'},
  {'title': 'Add money', 'time': '10/10/2022 06:27', 'money': '\$15.40'}
];

class FriendTransaction extends StatelessWidget {
  const FriendTransaction({super.key});

  @override
  Widget build(BuildContext context) {
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
              Icons.close,
              size: 24,
              color: grey1100,
            ),
          ),
        ),
        center: Text(
          'Buy house',
          style: headline(color: grey1100),
        ),
      ),
      bottomNavigationBar: Container(
        color: grey100,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: AppWidget.typeButtonStartAction(
            context: context,
            input: 'Invite Friends More Goal',
            onPressed: () {},
            bgColor: primary,
            borderColor: primary,
            textColor: grey1100),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: grey100,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              children: [
                AnimationClick(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      avtMale2,
                      width: 48,
                      height: 48,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Cameron William',
                  style: headline(color: grey1100),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 16),
              child: ProgressBar(width: width * 0.4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$5,680.00',
                  style: headline(color: grey1100),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF5784E8)),
                  child: Text(
                    '14%',
                    style: caption1(color: grey1100),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: emerald1, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'This is best friend!',
                    style: title3(color: grey1100),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '4 mutual saving goal',
                    style: subhead(color: grey1100),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Transaction History',
              style: title4(color: grey1100),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: items.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) => AnimationClick(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const SizedBox(height: 8),
                    Text(
                      items[index]['time']!,
                      style: caption1(color: grey1100.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
