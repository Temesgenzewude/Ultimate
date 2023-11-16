import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';

List<Map<String, dynamic>> items = [
  <String, dynamic>{
    'avt': avtMale,
    'name': 'Miranaha',
    'title': 'Borrow buy house',
    'balance': '\$5,680.00',
    'time': 90,
    'interest': 25,
    'favorite': true
  },
  <String, dynamic>{
    'avt': avtMale,
    'name': 'Miranaha',
    'title': 'Borrow buy house',
    'balance': '\$5,680.00',
    'time': 90,
    'interest': 25,
    'favorite': false
  },
  <String, dynamic>{
    'avt': avtMale,
    'name': 'Miranaha',
    'title': 'Borrow buy house',
    'balance': '\$5,680.00',
    'time': 90,
    'interest': 25,
    'favorite': false
  },
  <String, dynamic>{
    'avt': avtMale,
    'name': 'Miranaha',
    'title': 'Borrow buy house',
    'balance': '\$5,680.00',
    'time': 90,
    'interest': 25,
    'favorite': false
  },
];

class Invest2 extends StatefulWidget {
  const Invest2({super.key});

  @override
  State<Invest2> createState() => _Invest2State();
}

class _Invest2State extends State<Invest2> with SingleTickerProviderStateMixin {
  late TabController controller;
  List<String> tabs = [
    'Loan',
    'Borrow',
  ];
  Widget tabview() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) => AnimationClick(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: items[index]['favorite'] ? primary : grey200,
              borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          items[index]['avt'],
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        items[index]['name'],
                        style: callout(color: grey1100, fontWeight: '400'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      if (items[index]['favorite']) ...[
                        AnimationClick(
                            child: Image.asset(
                          star,
                          width: 24,
                          height: 24,
                        ))
                      ],
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AnimationClick(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: items[index]['favorite']
                                      ? grey1100
                                      : primary),
                              borderRadius: BorderRadius.circular(24)),
                          child: Image.asset(
                            checkbox,
                            width: 24,
                            height: 24,
                          ),
                        )),
                      ),
                      AnimationClick(
                          child: Image.asset(
                        shield,
                        width: 24,
                        height: 24,
                      )),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                items[index]['title']!,
                style: subhead(color: grey1000, fontWeight: '400'),
              ),
              Text(
                items[index]['balance']!,
                style: title2(color: grey1100),
              ),
              AppWidget.divider(context,
                  color: grey1100.withOpacity(0.1), vertical: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time',
                        style: subhead(color: grey900),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${items[index]['time']} days',
                        style: headline(color: grey1100),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Interest',
                        style: subhead(color: grey900),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                            color: grey1100,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          '+${items[index]['interest']} %',
                          style: caption1(color: primary),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppBarCpn(
        left: AnimationClick(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                avtMale,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        right: Row(
          children: [
            AnimationClick(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Image.asset(
                  chartBar,
                  width: 24,
                  height: 24,
                  color: grey1100,
                ),
              ),
            ),
            AnimationClick(
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(24)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      bellSimple,
                      width: 24,
                      height: 24,
                      color: grey1100,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 6,
                        width: 6,
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                            color: corn1,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GradientText(
                  'Balance',
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '\$12,860.44',
                    textAlign: TextAlign.center,
                    style: header(color: grey1100),
                  ),
                ),
                AnimationClick(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                    child: Text(
                      '\$462.8 Available',
                      style: callout(color: grey100),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  border: Border.all(color: grey300),
                  color: grey200,
                  borderRadius: BorderRadius.circular(20)),
              child: TabBar(
                controller: controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: primary,
                ),
                labelStyle: subhead(color: grey1100),
                unselectedLabelStyle: subhead(color: grey700),
                labelColor: grey1100,
                unselectedLabelColor: grey600,
                padding: const EdgeInsets.all(4),
                indicatorColor: primary,
                tabs: List.generate(
                  tabs.length,
                  (index) => Tab(text: tabs[index]),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(controller: controller, children: [
                tabview(),
                tabview(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
