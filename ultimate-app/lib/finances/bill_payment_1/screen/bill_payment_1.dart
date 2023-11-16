import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';

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

class BillPayment1 extends StatefulWidget {
  const BillPayment1({super.key});

  @override
  State<BillPayment1> createState() => _BillPayment1State();
}

class _BillPayment1State extends State<BillPayment1>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int _currentIndex = 0;
  List<String> tabs = [
    'All',
    'Upcoming (${items.length})',
    'Expried',
    'Complete'
  ];

  Widget tabView() {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) => AnimationClick(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: grey200, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              AppWidget.divider(context,
                  vertical: 16, color: grey1100.withOpacity(0.1)),
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
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
    controller.addListener(() {
      if (!controller.indexIsChanging) {
        setState(() {
          _currentIndex = controller.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Dashboard',
            style: header(color: grey1100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 24),
          child: TabBar(
            controller: controller,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: primary,
            ),
            labelStyle: headline(color: grey1100),
            unselectedLabelStyle: headline(color: grey600),
            labelColor: grey1100,
            unselectedLabelColor: grey600,
            indicatorColor: primary,
            tabs: List.generate(
              tabs.length,
              (index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _currentIndex == index ? primary : grey200,
                  ),
                  child: Text(tabs[index])),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(controller: controller, children: [
            tabView(),
            tabView(),
            tabView(),
            tabView(),
          ]),
        ),
      ]),
    );
  }
}
