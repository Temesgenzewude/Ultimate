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

  List<String> userTypes = ['User B', 'User A'];
  String? selectedUserType;
  final prefManager = sl<PrefManager>();
  bool _isLocationEnabledAndShared = false;

  Future<bool> _handleLocationPermission() async {
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

    return true;
  }

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
              )),
        ],
      ),
    );
  }

  // @override
  // void initState() {
  //   // _getCurrentPosition();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    final SliderBloc sliderBloc = BlocProvider.of<SliderBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
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
                height: height / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: BlocBuilder<SliderBloc, int>(
                    builder: (context, state) {
                      return PageView.builder(
                        padEnds: false,
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: landings.length,
                        onPageChanged: (value) {
                          if (value > state) {
                            sliderBloc.add(SwipeRight());
                          } else {
                            sliderBloc.add(SwipeLeft());
                          }
                        },
                        itemBuilder: (context, index) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20.0),
                          color: grey900),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          isDense: true,
                          // isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black87,
                            size: 30,
                          ),
                          dropdownColor: grey900,
                          style: const TextStyle(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          hint: const Text(
                            'Select User Type',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          items: userTypes.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }).toList(),
                          value: selectedUserType,
                          onChanged: (String? value) {
                            setState(() {
                              selectedUserType = value;
                              prefManager.userType = selectedUserType;
                              print(prefManager.userType);
                            });
                          },
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     fixedSize: const Size(150, 63),
                    //     backgroundColor: primary,
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)),
                    //   ),
                    //   onPressed: () async {
                    //     if (!_isLocationEnabledAndShared) {
                    //       await _getCurrentPosition();
                    //     }
                    //   },
                    //   child: Text(_isLocationEnabledAndShared
                    //       ? 'Location Shared!'
                    //       : 'Allow Location!'),
                    // ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
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
                            onTap: () async {
                              if (!_isLocationEnabledAndShared) {
                                Utils.flutterToast(
                                    'Please allow this app to access you location!');
                                await _getCurrentPosition();
                              }
                              if (_isLocationEnabledAndShared) {
                                if (selectedUserType == null) {
                                  Utils.flutterToast(
                                      'Please select user type to continue!');
                                  return;
                                } else {
                                  if (selectedUserType == 'User A') {
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.signUp);
                                    });
                                  } else if (selectedUserType == 'User B') {
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      Navigator.pushReplacementNamed(
                                          context, Routes.signUpB);
                                    });
                                  }
                                }
                              } else {
                                Utils.flutterToast(
                                    'Please enable location services in your settings and allow this app to access your location!');
                                return;
                              }
                            },
                            child: SizedBox(
                              height: 55,
                              child: Text(
                                selectedUserType == null
                                    ? 'Continue'.toUpperCase()
                                    : 'Continue as $selectedUserType'
                                        .toUpperCase(),
                                style: const TextStyle(
                                    color: grey1100, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
