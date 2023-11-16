import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'vote.dart';

class VoteHome extends StatefulWidget {
  const VoteHome({super.key});

  @override
  State<VoteHome> createState() => _VoteHomeState();
}

class _VoteHomeState extends State<VoteHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 3;

  @override
  void initState() {
    listWidget = [
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Vote(),
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
                  context, usersFour, usersFour, 'Users Four',
                  hasContainer: true),
              AppWidget.createItemNav(
                  context, lightning, lightning, 'Lightning',
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
