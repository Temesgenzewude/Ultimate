import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/util/show_toast_message.dart';
import 'package:geolocator/geolocator.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/slider/bloc_slider.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../dependency_indjection.dart';
import '../../../persisted_shared_pref.dart';
import '../../../sharedPreferences.dart';
import '../widget/onboarding_widget.dart';

final List<Color> colors = [
  green,
  stPatricksBlue,
  corn1,
  lightSalmon,
  emerald1,
  primary
];

final List<String> landings = [
  onBoarding1,
  onBoarding12,
  onBoarding1,
  onBoarding9,
  onBoarding1,
  onBoarding12
];

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  Position? _currentPosition;

  // User types for selection
  List<String> userTypes = ['User B', 'User A'];
  String? selectedUserType;
  final prefManager = sl<PrefManager>();
  final _persistentPrefs = sl<PersistedSharePrefManager>();
  bool _isLocationEnabledAndShared = false;

  // Check if location service is enabled and update preferences accordingly
  Future<void> _checkLocationServiceStatus() async {
    final bool isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      // If location service is disabled, reset the variable in persistent shared preferences
      _persistentPrefs.isLocationEnableAndShared = false;
    }
  }

  // Handle location permission logic
  Future<bool> _handleLocationPermission() async {
    // Check if location permission has already been asked
    bool locationPermissionAsked =
        _persistentPrefs.isLocationEnableAndShared ?? false;
    if (locationPermissionAsked) {
      // Recheck location service status each time user logs in
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (!isLocationServiceEnabled) {
        return false;
      }
      return true;
    }
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Utils.flutterToast('Please enable location services in your settings!');
      final result = await Geolocator.openLocationSettings();
      if (result) {
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
      }
    }

    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Request location service and permission
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Utils.flutterToast(
            'You have denied this app from accessing your location!');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      final result = await Geolocator.openAppSettings();
      if (result) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        Utils.flutterToast(
            'You have denied this app from accessing your location!');
        return false;
      }
    }

    _persistentPrefs.isLocationEnableAndShared = true;

    return true;
  }

  // Get the current position
  Future<bool> _getCurrentPosition() async {
    try {
      final hasPermission = await _handleLocationPermission();

      debugPrint('hasPermission: $hasPermission');

      if (!hasPermission) {
        setState(() {
          _isLocationEnabledAndShared = false;
        });

        return false;
      }

      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
        _isLocationEnabledAndShared = true;
      });

      prefManager.latitude = _currentPosition?.latitude.toString() ?? '';
      prefManager.longitude = _currentPosition?.longitude.toString() ?? '';

      debugPrint('latitude: ${_currentPosition?.latitude}');
      debugPrint('longitude: ${_currentPosition?.longitude}');
      _persistentPrefs.isLocationEnableAndShared = true;

      return true;
    } catch (e) {
      debugPrint('Error getting current position: $e');
      return false;
    }
  }

  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );
  Widget landing(BuildContext context, int index, double width, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height / 2,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: colors[index], borderRadius: BorderRadius.circular(24)),
          ),
          Positioned(
              bottom: index % 2 == 0 ? -10 : 10,
              child: Image.asset(
                landings[index],
                height: height / 2.4,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }

  @override
  void initState() {
    // Check and update location service status on initialization
    _checkLocationServiceStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      logo,
                      width: 56,
                      height: 56,
                    ),
                    BlocBuilder<SliderBloc, int>(
                      builder: (context, state) {
                        return OnBoardingWidget.createIndicator(
                            lengthImage: landings.length, currentImage: state);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 2.09,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  // Build a PageView widget that displays the onboarding screens
                  child: BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return PageView.builder(
                        padEnds: false,
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: landings.length,
                        onPageChanged: (value) {
                          // Update the state of the SliderBloc based on the current page
                          if (value > state) {
                            sliderBloc.add(SwipeRight());
                          } else {
                            sliderBloc.add(SwipeLeft());
                          }
                        },
                        itemBuilder: (context, index) {
                          // Build the individual onboarding screen
                          return landing(context, index, width, height);
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Private Wealth Management',
                        style: header(color: grey1100, letterSpacing: 2),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Why would I want to trade an Event Contract over another asset class?',
                        style: body(color: grey800),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: primary),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // Handle onTap event for the "Continue as user A" button
                          onTap: () async {
                            await _getCurrentPosition();

                            // Check if location is enabled and shared
                            if (_persistentPrefs.isLocationEnableAndShared ==
                                true) {
                              prefManager.userType = 'User A';

                              // Delay navigation to the sign up screen for 1 second
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.signUp,
                                );
                              });
                            }
                          },
                          child: SizedBox(
                            height: 55,
                            child: Text(
                              'Continue as user A'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          // Handle onTap event for "Continue as User B" button
                          onTap: () async {
                            await _getCurrentPosition();

                            if (_persistentPrefs.isLocationEnableAndShared ==
                                true) {
                              prefManager.userType = 'User B';

                              // Delay navigation to the sign up page by 1 second
                              Future.delayed(const Duration(seconds: 1), () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.signUpB,
                                );
                              });
                            }
                          },
                          child: SizedBox(
                            height: 55,
                            child: Text(
                              'Continue as User B'.toUpperCase(),
                              style: const TextStyle(
                                  color: grey1100, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
