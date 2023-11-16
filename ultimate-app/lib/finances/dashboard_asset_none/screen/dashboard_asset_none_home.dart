import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/widget/animation_click.dart';
import 'dashboard_asset_none.dart';

class DashboardAssetNoneHome extends StatefulWidget {
  const DashboardAssetNoneHome({super.key});

  @override
  State<DashboardAssetNoneHome> createState() => _DashboardAssetNoneHomeState();
}

class _DashboardAssetNoneHomeState extends State<DashboardAssetNoneHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const DashboardAssetNone(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) {
              if (value == 2) {
                return;
              }
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              AppWidget.createItemNav3(
                  context, houseSimple, houseSimple, 'House Simple',
                  iconColor: emerald1),
              AppWidget.createItemNav3(
                  context, cardholder, cardholder, 'Card Holder',
                  iconColor: emerald1),
              const BottomNavigationBarItem(icon: SizedBox(), label: 'Add'),
              AppWidget.createItemNav3(context, chartLine, chartLine, 'Chart',
                  iconColor: emerald1),
              BottomNavigationBarItem(
                  icon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        avtMale,
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                      _currentIndex == 4
                          ? Container(
                              height: 4,
                              width: 4,
                              margin: const EdgeInsets.only(top: 4),
                              decoration: BoxDecoration(
                                  color: emerald1,
                                  borderRadius: BorderRadius.circular(24)),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  label: 'User'),
            ],
          ),
          Positioned(
              top: -12,
              child: AnimationClick(
                child: Container(
                  decoration: BoxDecoration(
                      color: emerald1, borderRadius: BorderRadius.circular(99)),
                  padding: const EdgeInsets.all(18),
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: grey1100,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
