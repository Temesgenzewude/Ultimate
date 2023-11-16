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
    'icon': icShopping,
    'money': 500,
    'subTitle': '50.000 Credits'
  },
  <String, dynamic>{
    'icon': icShopping,
    'money': 1000,
    'subTitle': '100.000 Credits'
  },
  <String, dynamic>{
    'icon': icShopping,
    'money': 1500,
    'subTitle': '150.000 Credits'
  },
  <String, dynamic>{
    'icon': icShopping,
    'money': 500,
    'subTitle': '50.000 Credits'
  },
];

class Payout extends StatefulWidget {
  const Payout({super.key});

  @override
  State<Payout> createState() => _PayoutState();
}

class _PayoutState extends State<Payout> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;

  Widget itemView() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) => AnimationClick(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: grey200, borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(
                    items[index]['icon']!,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '\$${items[index]['money']!}',
                      style: title3(color: grey1100),
                    ),
                  )
                ],
              ),
              AppWidget.divider(context,
                  vertical: 16, color: grey300.withOpacity(0.3)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${items[index]['subTitle']}',
                    style: body(color: grey1100),
                  ),
                  AnimationClick(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        'Payout',
                        style: headline(color: grey1100),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller =
        TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        left: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            logo,
            width: 40,
            height: 40,
          ),
        ),
        right: AnimationClick(
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(colors: [
                  const Color(0xFFCFE1FD).withOpacity(0.9),
                  const Color(0xFFFFFDE1).withOpacity(0.9),
                ])),
            child: Text(
              '\$130',
              style: subhead(color: primary, fontWeight: '700'),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: GradientText(
              'Payout',
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
          Container(
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: grey200,
                border: Border.all(color: grey300)),
            child: TabBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              controller: _controller,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: primary,
              ),
              labelStyle: footnote(color: grey1100),
              unselectedLabelStyle: footnote(color: grey1100),
              labelColor: grey1100,
              unselectedLabelColor: grey1100,
              indicatorColor: primary,
              indicatorPadding: const EdgeInsets.all(2),
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              tabs: const [
                Tab(text: 'Payout'),
                Tab(text: 'History'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _controller, children: [
              itemView(),
              itemView(),
            ]),
          )
        ],
      ),
    );
  }
}
