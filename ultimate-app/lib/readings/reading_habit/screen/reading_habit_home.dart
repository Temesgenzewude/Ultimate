import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'reading_habit.dart';

class ReadingHabitHome extends StatefulWidget {
  const ReadingHabitHome({super.key});

  @override
  State<ReadingHabitHome> createState() => _ReadingHabitHomeState();
}

class _ReadingHabitHomeState extends State<ReadingHabitHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;

  @override
  void initState() {
    listWidget = [
      const ReadingHabit(),
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
