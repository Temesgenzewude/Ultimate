import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../widget/doughnut_chart.dart';

List<String> avts = [avtMale2, avtMale3, avtMale4];

List<String> items = ['🔥 Hot', '💖 Crush', '🎉 Party', '🔥 Lovely'];

class Vote extends StatelessWidget {
  const Vote({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: Row(
          children: [
            AnimationClick(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  user,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
            AnimationClick(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  icSearch,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
          ],
        ),
        right: Container(
          height: 50,
          width: width / 2,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
              color: grey200,
              borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                    alignment: Alignment.centerLeft,
                    children: List.generate(avts.length, (index) {
                      return Positioned(
                          left: index * 26,
                          child: AnimationClick(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: grey100)),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(avts[index]),
                                radius: 16,
                              ),
                            ),
                          ));
                    })),
              ),
              AnimationClick(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      houseDark,
                      width: 28,
                      height: 28,
                      color: grey100,
                    ),
                    Positioned(
                        top: -16,
                        right: -5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(24)),
                          child: Text(
                            '3',
                            style: caption1(color: corn1),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AnimationClick(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      heartDark,
                      width: 28,
                      height: 28,
                      color: grey100,
                    ),
                    Positioned(
                        top: -16,
                        right: -5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(24)),
                          child: Text(
                            '2',
                            style: caption1(color: corn1),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimationClick(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: Image.asset(avtFemale, width: 56, height: 56),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Albert Flores!',
                        style: title4(color: grey1100),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'UI/UX Designer',
                        style: subhead(color: grey800),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              height: height / 2.5, width: width, child: const DoughnutChart()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 48),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: primary, borderRadius: BorderRadius.circular(24)),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(
                  items.length + 1,
                  (index) => index == items.length
                      ? AnimationClick(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xFFCFE1FD).withOpacity(0.9),
                                const Color(0xFFFFFDE1).withOpacity(0.9),
                              ]),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 24,
                                  color: grey100,
                                ),
                                Text(
                                  'add your own',
                                  style: headline(color: grey100),
                                )
                              ],
                            ),
                          ),
                        )
                      : AnimationClick(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                                color: grey100,
                                borderRadius: BorderRadius.circular(24)),
                            child: Text(
                              items[index],
                              style: headline(color: grey1100),
                            ),
                          ),
                        )),
            ),
          )
        ],
      ),
    );
  }
}
