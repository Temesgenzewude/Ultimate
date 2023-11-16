import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'bill_payment_1.dart';

class BillPayment1Home extends StatefulWidget {
  const BillPayment1Home({super.key});

  @override
  State<BillPayment1Home> createState() => _BillPayment1HomeState();
}

class _BillPayment1HomeState extends State<BillPayment1Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;

  @override
  void initState() {
    listWidget = [
      const BillPayment1(),
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
