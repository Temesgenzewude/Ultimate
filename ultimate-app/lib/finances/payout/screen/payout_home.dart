import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'payout.dart';

class PayoutHome extends StatefulWidget {
  const PayoutHome({super.key});

  @override
  State<PayoutHome> createState() => _PayoutHomeState();
}

class _PayoutHomeState extends State<PayoutHome> {
   List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const Payout(),
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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: Material(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              AppWidget.createItemNav(context, houseSimple, houseSimple, 'Home',
                  iconColor: corn1),
              AppWidget.createItemNav(context, chartBar, chartBar, 'Chart',
                  iconColor: corn1),
              AppWidget.createItemNav(context, wallet, wallet, 'Wallet',
                  iconColor: corn1),
              AppWidget.createItemNav(context, gearSix, gearSix, 'Setting',
                  iconColor: corn1),
            ],
          ),
        ),
      ),
    );
  }
}
