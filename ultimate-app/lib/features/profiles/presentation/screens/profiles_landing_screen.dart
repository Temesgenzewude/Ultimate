import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/app/widget_support.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:flutter_ultimate/common/constant/images.dart';
import 'package:flutter_ultimate/common/constant/styles.dart';
import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:flutter_ultimate/common/widget/animation_click.dart';
import 'package:flutter_ultimate/common/widget/app_bar_cpn.dart';
import 'package:flutter_ultimate/common/widget/gradient_text.dart';
import 'package:flutter_ultimate/features/profiles/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/for_you.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/profile_landing_loading.dart';
import 'package:flutter_ultimate/features/profiles/presentation/widgets/yesterday.dart';

class ProfileLanding extends StatefulWidget {
  const ProfileLanding({Key? key}) : super(key: key);

  @override
  State<ProfileLanding> createState() => _ProfileLandingState();
}

class _ProfileLandingState extends State<ProfileLanding> {
  bool isFinished = false;
  late ProfileBloc _profileBloc;
  List<String> listWidget = [];
  int _currentIndex = 3;

  @override
  void initState() {
    super.initState();
    listWidget = [
      Routes.feedPage,
      Routes.feedPage,
      Routes.settingsScreen,
      Routes.profilesLanding,
    ];
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.add(GetProfilesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
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
                if (_currentIndex != value && value != 1) {
                  _currentIndex = value;
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).pushNamed(listWidget[value]);
                  });
                }
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
      appBar: AppBarCpn(
        left: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  AnimationClick(
                    function: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      careLeft,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  AnimationClick(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: grey200,
                          borderRadius: BorderRadius.circular(24)),
                      child: Image.asset(
                        map_pin,
                        width: 24,
                        height: 24,
                        color: stPatricksBlue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '21 Pentrefelin, LL68 9PE',
                    style: headline(color: grey1100),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AnimationClick(
                    child: Image.asset(
                      icKeyboardRight,
                      width: 24,
                      height: 24,
                      color: grey600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        right: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: AnimationClick(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              avt_female,
              width: 32,
              height: 32,
            ),
          )),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: grey200, borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'What to ',
                          style: const TextStyle(
                              fontSize: 34,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SpaceGrotesk'),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                        const SizedBox(height: 8),
                        GradientText(
                          'eat now?',
                          style: const TextStyle(
                              fontSize: 34,
                              height: 1,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SpaceGrotesk'),
                          gradient: LinearGradient(colors: [
                            const Color(0xFFCFE1FD).withOpacity(0.9),
                            const Color(0xFFFFFDE1).withOpacity(0.9),
                          ]),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      children: [
                        Image.asset(clouds, width: 48, height: 48),
                        const SizedBox(height: 8),
                        Text(
                          '37°C',
                          style: title4(color: corn1),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 4,
                child: const ForYou(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                child: GradientText(
                  'Yesterday',
                  style: const TextStyle(
                      fontSize: 28,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
              ),
              // Yesterday(userBProfiels: state.userBProfiles),
              BlocConsumer<ProfileBloc, ProfileState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProfileLoadingState ||
                      state is ProfileInitialState) {
                    // return LoadingAnimationWidget.fourRotatingDots(
                    //   color: Colors.white,
                    //   size: 20,
                    // );
                    return ProfileLandingLoading();
                  } else if (state is UserBProfilesSuccessState) {
                    return Yesterday(userBProfiels: state.userBProfiles);
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 64,
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                height: height / 5,
                width: width,
                decoration: BoxDecoration(
                    gradient: Theme.of(context).colorLinearBottom2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
