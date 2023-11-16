import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/widget/animation_click.dart';
import 'profile_seven.dart';

class ProfileSevenHome extends StatefulWidget {
  const ProfileSevenHome({super.key});

  @override
  State<ProfileSevenHome> createState() => _ProfileSevenHomeState();
}

class _ProfileSevenHomeState extends State<ProfileSevenHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 1;

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
      const Scaffold(
        backgroundColor: grey100,
      ),
      const ProfileSeven(),
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
                  createItemNav(context, userProfile, userProfile, 'User'),
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
