import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../finances/wallet_2/screen/wallet_2.dart';

class Wallet2Home extends StatefulWidget {
  const Wallet2Home({super.key});

  @override
  State<Wallet2Home> createState() => _Wallet2HomeState();
}

class _Wallet2HomeState extends State<Wallet2Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;

  @override
  void initState() {
    listWidget = [
      const Wallet2(),
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
              if (value == 2) {
                return;
              }
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
              BottomNavigationBarItem(
                  icon: Image.asset(
                    logo,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  label: 'Logo'),
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
