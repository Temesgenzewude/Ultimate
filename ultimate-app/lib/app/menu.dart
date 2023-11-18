import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/auth/authentication_bloc.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../app/widget_support.dart';
import '../common/bloc/slider/bloc_slider.dart';
import '../common/route/routes.dart';

final List<Map<String, String>> routers = [
  {'title': 'Onboarding', 'route': Routes.onboarding},
  {'title': 'Authentication', 'route': Routes.authentication},
  {'title': 'Profile', 'route': Routes.profile},
  {'title': 'Finance', 'route': Routes.finance},
  {'title': 'Social Media', 'route': Routes.socialMedia},
  {'title': 'Food Delivery', 'route': Routes.foodDelivery},
  {'title': 'Ecommerce', 'route': Routes.ecommerce},
  {'title': 'Reading', 'route': Routes.reading},
];

class MenuNavigation extends StatefulWidget {
  const MenuNavigation({Key? key}) : super(key: key);

  @override
  State<MenuNavigation> createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigation> {
  late SliderBloc sliderBloc;
  int selected = 0;

  @override
  void didChangeDependencies() {
    sliderBloc = BlocProvider.of<SliderBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    sliderBloc.add(SwipeReset());
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (BlocProvider.of<AuthenticationBloc>(context).isAuthenticated()) {
          Navigator.of(context).pushReplacementNamed(Routes.profile);
        }
      },
      child: Scaffold(
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
                                      color:
                                          selected == index ? corn1 : grey600),
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
      ),
    );
  }
}
