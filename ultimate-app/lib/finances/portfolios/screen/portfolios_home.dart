import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../finances/portfolios/screen/portfolios.dart';

class PortfoliosHome extends StatefulWidget {
  const PortfoliosHome({super.key});

  @override
  State<PortfoliosHome> createState() => _PortfoliosHomeState();
}

class _PortfoliosHomeState extends State<PortfoliosHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const Portfolios(),
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
        ),
      ),
    );
  }
}
