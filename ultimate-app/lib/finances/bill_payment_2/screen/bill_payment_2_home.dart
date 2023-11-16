import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/widget/animation_click.dart';
import 'bill_payment_2.dart';

class BillPayment2Home extends StatefulWidget {
  const BillPayment2Home({super.key});

  @override
  State<BillPayment2Home> createState() => _BillPayment2HomeState();
}

class _BillPayment2HomeState extends State<BillPayment2Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;

  BottomNavigationBarItem createItemNav(BuildContext context,
      String iconInactive, String iconActive, String label,
      {bool hasIntro = false}) {
    return BottomNavigationBarItem(
        activeIcon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: primary, borderRadius: BorderRadius.circular(24)),
          child: Image.asset(
            iconActive,
            width: 24,
            height: 24,
            color: corn1,
            fit: BoxFit.cover,
          ),
        ),
        icon: Image.asset(
          iconInactive,
          width: 24,
          height: 24,
          color: grey600,
          fit: BoxFit.cover,
        ),
        label: label);
  }

  @override
  void initState() {
    listWidget = [
      const BillPayment2(),
      const Scaffold(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: BottomNavigationBar(
                backgroundColor: grey300,
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0,
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                items: [
                  createItemNav(context, receipt, receipt, 'Receipt'),
                  createItemNav(context, user, user, 'User'),
                ],
              ),
            ),
          ),
          Positioned(
              top: -30,
              child: AnimationClick(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color: grey200, width: 5),
                      color: primary,
                      borderRadius: BorderRadius.circular(48)),
                  child: const Icon(
                    Icons.add,
                    size: 32,
                    color: corn1,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
