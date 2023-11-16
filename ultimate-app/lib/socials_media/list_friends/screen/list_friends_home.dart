import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/images.dart';
import 'list_friends.dart';

class ListFriendsHome extends StatefulWidget {
  const ListFriendsHome({super.key});

  @override
  State<ListFriendsHome> createState() => _ListFriendsHomeState();
}

class _ListFriendsHomeState extends State<ListFriendsHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 4;
  @override
  void initState() {
    listWidget = [
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const ListFriends(),
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
          AppWidget.createItemNav(context, user, user, 'User'),
        ],
      ),
    );
  }
}
