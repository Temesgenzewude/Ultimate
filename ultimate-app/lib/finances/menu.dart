import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/route/routes.dart';

final List<Map<String, String>> routers = [
  {'title': 'Bill Payment 1', 'route': Routes.billPayment1},
  {'title': 'Bill Payment 2', 'route': Routes.billPayment2},
  {'title': 'Invest 1', 'route': Routes.invest1},
  {'title': 'Stock 1', 'route': Routes.stock1},
  {'title': 'Portfolios', 'route': Routes.portfolios},
  {'title': 'Invest 2', 'route': Routes.invest2},
  {'title': 'Wallet 1', 'route': Routes.wallet1},
  {'title': 'Wallet 2', 'route': Routes.wallet2},
  {'title': 'Stock 2', 'route': Routes.stock2},
  {'title': 'Wallet 3', 'route': Routes.wallet3},
  {'title': 'Task Earn', 'route': Routes.taskEarn},
  {'title': 'Profits', 'route': Routes.profits},
  {'title': 'Payout', 'route': Routes.payout},
  {'title': 'Main Saving', 'route': Routes.mainSaving},
  {'title': 'Goal Details', 'route': Routes.goalDetail},
  {'title': 'Delete Goal', 'route': Routes.deleteGoal},
  {'title': 'Chart', 'route': Routes.chart_saving},
  {'title': 'Friends Transaction', 'route': Routes.friendTransaction},
  {'title': 'Dashboard Assets None', 'route': Routes.dashboardAssetNone},
  {'title': 'Dashboard Full Nopremium', 'route': Routes.dashboardFullNopremium},
];

class MenuFinanceNavigation extends StatefulWidget {
  const MenuFinanceNavigation({Key? key}) : super(key: key);

  @override
  State<MenuFinanceNavigation> createState() => _MenuFinanceNavigationState();
}

class _MenuFinanceNavigationState extends State<MenuFinanceNavigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              logo,
              width: 48,
              height: 48,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(32),
                      itemBuilder: (context, index) {
                        return AnimationClick(
                          function: () {
                            Navigator.of(context)
                                .pushNamed(routers[index]['route']!);
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                routers[index]['title']!,
                                style: title3(
                                    color: selected == index ? corn1 : grey600),
                              ),
                              selected == index
                                  ? Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: corn1,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 32),
                      itemCount: routers.length),
                  Positioned(
                      bottom: 16,
                      right: 0,
                      child: Image.asset(
                        menu,
                        height: height / 4,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
