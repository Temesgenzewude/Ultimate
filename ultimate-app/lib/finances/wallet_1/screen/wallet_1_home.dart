import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../finances/wallet_1/screen/wallet_1.dart';

class Wallet1Home extends StatefulWidget {
  const Wallet1Home({super.key});

  @override
  State<Wallet1Home> createState() => _Wallet1HomeState();
}

class _Wallet1HomeState extends State<Wallet1Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const Wallet1(),
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
      bottomNavigationBar: BottomNavigationBar(
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
          AppWidget.createItemNav(
              context, houseSimple, houseSimple, 'House Simple',
              iconColor: corn1),
          AppWidget.createItemNav(
              context, calendarBlank, calendarBlank, 'Calendar',
              iconColor: corn1),
          AppWidget.createItemNav(context, timer, timer, 'Timer',
              iconColor: corn1),
          AppWidget.createItemNav(context, user, user, 'User',
              iconColor: corn1),
        ],
      ),
    );
  }
}
