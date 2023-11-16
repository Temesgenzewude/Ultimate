import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'bookmark_1.dart';

class Bookmark1Home extends StatefulWidget {
  const Bookmark1Home({super.key});

  @override
  State<Bookmark1Home> createState() => _Bookmark1HomeState();
}

class _Bookmark1HomeState extends State<Bookmark1Home> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const Bookmark1(),
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
