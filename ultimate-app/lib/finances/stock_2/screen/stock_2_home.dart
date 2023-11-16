import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'stock_2.dart';

class Stock2Home extends StatefulWidget {
  const Stock2Home({super.key});

  @override
  State<Stock2Home> createState() => _Stock2HomeState();
}

class _Stock2HomeState extends State<Stock2Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const Stock2(),
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFFCFE1FD).withOpacity(0.9),
              const Color(0xFFFFFDE1).withOpacity(0.9),
            ]),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
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
