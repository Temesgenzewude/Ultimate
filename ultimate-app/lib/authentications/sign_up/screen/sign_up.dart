import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../widget/sign_in_tab.dart';
import '../widget/sign_up_tab.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    _controller =
        TabController(length: 2, vsync: this, initialIndex: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  bg10,
                  width: width,
                  height: height / 3.5,
                  fit: BoxFit.fill,
                ),
                Expanded(child: Container())
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                height: height / 1.25,
                decoration: const BoxDecoration(
                    color: grey100,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: grey200,
                          border: Border.all(color: grey300)),
                      child: TabBar(
                        onTap: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        controller: _controller,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: primary,
                        ),
                        labelStyle: footnote(color: grey1100),
                        unselectedLabelStyle: footnote(color: grey1100),
                        labelColor: grey1100,
                        unselectedLabelColor: grey1100,
                        indicatorColor: primary,
                        indicatorPadding: const EdgeInsets.all(2),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        tabs: [
                          Tab(text: 'Sign in'.toUpperCase()),
                          Tab(text: 'sign up'.toUpperCase()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: _controller,
                          children: const [
                            SignInTab(),
                            SignUpTab(),
                          ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
