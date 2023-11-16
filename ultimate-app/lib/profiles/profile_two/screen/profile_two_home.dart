import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/images.dart';
import 'profile_two.dart';

class ProfileTwoHome extends StatefulWidget {
  const ProfileTwoHome({super.key});

  @override
  State<ProfileTwoHome> createState() => _ProfileTwoHomeState();
}

class _ProfileTwoHomeState extends State<ProfileTwoHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 3;
  @override
  void initState() {
    listWidget = [
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const ProfileTwo(),
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
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          AppWidget.createItemNav(
              context, houseSimple, houseSimple, 'House Simple'),
          AppWidget.createItemNav(
              context, calendarBlank, calendarBlank, 'Calendar'),
          AppWidget.createItemNav(context, timer, timer, 'Timer'),
          AppWidget.createItemNav(context, userProfile, userProfile, 'User'),
        ],
      ),
    );
  }
}
