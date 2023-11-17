import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../app/widget_support.dart';


import '../common/bloc/slider/bloc_slider.dart';
import '../common/constant/images.dart';
import '../common/route/routes.dart';
import 'onboarding_1/screen/onboarding_1.dart';

final List<String> routers = [
  Routes.onBoarding1,
];

class MenuOnboardingNavigation extends StatefulWidget {
  const MenuOnboardingNavigation({Key? key}) : super(key: key);

  @override
  State<MenuOnboardingNavigation> createState() =>
      _MenuOnboardingNavigationState();
}

class _MenuOnboardingNavigationState extends State<MenuOnboardingNavigation> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              logo,
              width: 48,
              height: 48,
            ),
            const Expanded(child: OnBoardingOne())
          ],
        ),
      ),
    );
  }
}
