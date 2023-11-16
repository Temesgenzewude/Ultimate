import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'invest_1.dart';

class Invest1Home extends StatefulWidget {
  const Invest1Home({super.key});

  @override
  State<Invest1Home> createState() => _Invest1HomeState();
}

class _Invest1HomeState extends State<Invest1Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const Invest1(),
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
      bottomNavigationBar: BottomNavigationBar(
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
          AppWidget.createItemNav2(
              context, houseSimple, houseSimple, 'House Simple',
              iconColor: corn1),
          AppWidget.createItemNav2(
              context, calendarBlank, calendarBlank, 'Calendar',
              iconColor: corn1),
          BottomNavigationBarItem(
              icon: Image.asset(
                logo,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              label: 'Logo'),
          AppWidget.createItemNav2(context, timer, timer, 'Timer',
              iconColor: corn1),
          AppWidget.createItemNav2(context, user, user, 'User',
              iconColor: corn1),
        ],
      ),
    );
  }
}
