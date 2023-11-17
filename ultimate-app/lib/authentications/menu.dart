import 'package:flutter/material.dart';

import '../app/widget_support.dart';
import '../common/constant/colors.dart';
import '../common/constant/images.dart';
import '../common/constant/styles.dart';
import '../common/route/routes.dart';
import '../common/widget/animation_click.dart';

final List<Map<String, String>> routers = [
  {'title': 'Account information', 'route': Routes.accountInformation},
  {'title': 'Add mobile number', 'route': Routes.addMobileNumber},
  {'title': 'Forgot password', 'route': Routes.forgotPassword},
  {'title': 'Kyc', 'route': Routes.kyc},
  {'title': 'Login', 'route': Routes.login},
  {'title': 'Register', 'route': Routes.register},
  {'title': 'Reset password', 'route': Routes.resetPassword},
  {'title': 'Sign up', 'route': Routes.signUp},
  {'title': 'Sign up social', 'route': Routes.signUpSocial},
  {'title': 'Verify', 'route': Routes.verify},
];

class MenuAuthenNavigation extends StatefulWidget {
  const MenuAuthenNavigation({Key? key}) : super(key: key);

  @override
  State<MenuAuthenNavigation> createState() => _MenuAuthenNavigationState();
}

class _MenuAuthenNavigationState extends State<MenuAuthenNavigation> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              logo,
              width: 48,
              height: 48,
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(32),
                      itemBuilder: (context, index) {
                        return AnimationClick(
                          function: () {
                            Navigator.of(context)
                                .pushNamed(routers[index]['route']!);
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                routers[index]['title']!,
                                style: title3(
                                    color: selected == index ? corn1 : grey600),
                              ),
                              selected == index
                                  ? Container(
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          color: corn1,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 32),
                      itemCount: routers.length),
                  Positioned(
                      bottom: 16,
                      right: 0,
                      child: Image.asset(
                        menu,
                        height: height / 4,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
