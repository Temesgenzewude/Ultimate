import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'main_seller_2.dart';

class MainSeller2Home extends StatefulWidget {
  const MainSeller2Home({super.key});

  @override
  State<MainSeller2Home> createState() => _MainSeller2HomeState();
}

class _MainSeller2HomeState extends State<MainSeller2Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;

  @override
  void initState() {
    listWidget = [
      const MainSeller2(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: grey300,
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
                  hasContainer: true),
              AppWidget.createItemNav(
                  context, calendarBlank, calendarBlank, 'Calendar',
                  hasContainer: true),
              AppWidget.createItemNav(context, timer, timer, 'Timer',
                  hasContainer: true),
              AppWidget.createItemNav(context, user, user, 'User',
                  hasContainer: true),
            ],
          ),
        ),
      ),
    );
  }
}
