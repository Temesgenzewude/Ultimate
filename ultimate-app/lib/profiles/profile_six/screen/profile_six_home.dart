import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/images.dart';
import 'profile_six.dart';

class ProfileSixHome extends StatefulWidget {
  const ProfileSixHome({super.key});

  @override
  State<ProfileSixHome> createState() => _ProfileSixHomeState();
}

class _ProfileSixHomeState extends State<ProfileSixHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 4;
  @override
  void initState() {
    listWidget = [
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const ProfileSix(),
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
          AppWidget.createItemNav(
              context, houseSimple, houseSimple, 'House Simple'),
          AppWidget.createItemNav(
              context, calendarBlank, calendarBlank, 'Calendar'),
          BottomNavigationBarItem(
              icon: Image.asset(
                logo,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              label: 'Logo'),
          AppWidget.createItemNav(context, timer, timer, 'Timer'),
          AppWidget.createItemNav(context, userProfile, userProfile, 'User'),
        ],
      ),
    );
  }
}
