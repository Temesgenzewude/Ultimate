import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'card_product.dart';

class CardProductHome extends StatefulWidget {
  const CardProductHome({super.key});

  @override
  State<CardProductHome> createState() => _CardProductHomeState();
}

class _CardProductHomeState extends State<CardProductHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const CardProduct(),
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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Material(
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          child: BottomNavigationBar(
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
                  iconColor: grey1100),
              AppWidget.createItemNav2(
                  context, calendarBlank, calendarBlank, 'Calendar',
                  iconColor: grey1100),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    logo,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  label: 'Logo'),
              AppWidget.createItemNav2(context, timer, timer, 'Timer',
                  iconColor: grey1100),
              AppWidget.createItemNav2(context, user, user, 'User',
                  iconColor: grey1100),
            ],
          ),
        ),
      ),
    );
  }
}
