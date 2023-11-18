import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/auth/authentication_bloc.dart';
import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:flutter_ultimate/data/models/authentication_model.dart';
import 'package:geolocator/geolocator.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/textfield_pass.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  TextEditingController usernameCtl = TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController repasswordCtl = TextEditingController();
  TextEditingController nameCtl = TextEditingController();
  FocusNode nameFn = FocusNode();
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();
  TextEditingController addressCtl = TextEditingController();
  FocusNode addressFn = FocusNode();
  FocusNode repasswordFn = FocusNode();
  bool showPass = false;
  bool showRePass = false;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      debugPrint('location: ${_currentPosition?.latitude}');
      debugPrint('location: ${_currentPosition?.longitude}');
    }).catchError((dynamic e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 20,
            ),
            GradientText(
              'Welcom to  Ultimate!',
              style: const TextStyle(
                  fontSize: 32,
                  height: 1,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SpaceGrotesk'),
              gradient: LinearGradient(colors: [
                const Color(0xFFCFE1FD).withOpacity(0.9),
                const Color(0xFFFFFDE1).withOpacity(0.9),
              ]),
            ),
            Column(
              children: [
                TextFieldCpn(
                  controller: nameCtl,
                  focusNode: nameFn,
                  labelText: 'Name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFieldCpn(
                    controller: usernameCtl,
                    focusNode: usernameFn,
                    labelText: 'Email',
                  ),
                ),
                TextFieldCpn(
                  controller: addressCtl,
                  focusNode: addressFn,
                  labelText: 'Address',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFieldCpn(
                    controller: phoneCtl,
                    focusNode: phoneFn,
                    labelText: 'Phone',
                    keyboardType: TextInputType.phone,
                  ),
                ),
                TextFieldPassCpn(
                    controller: passwordCtl,
                    focusNode: passwordFn,
                    labelText: 'Password',
                    showSuffixIcon: true,
                    obscureText: !showPass,
                    suffixIcon: showPass ? eye : eyeSlash,
                    colorSuffixIcon: grey500,
                    functionSuffer: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    }),
                TextFieldPassCpn(
                    controller: repasswordCtl,
                    focusNode: repasswordFn,
                    labelText: 'Re Password',
                    showSuffixIcon: true,
                    obscureText: !showRePass,
                    suffixIcon: showRePass ? eye : eyeSlash,
                    colorSuffixIcon: grey500,
                    functionSuffer: () {
                      setState(() {
                        showRePass = !showRePass;
                      });
                    }),

                const SizedBox(height: 32),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AuthenticationSuccessState) {
                      Future.delayed(Duration.zero, () {
                        // Navigate to the home page or some authenticated page
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.signUp);
                      });
                    } else if (state is AuthenticationFailureState) {
                      return const Center(
                          child: Text('Failure while creating user'));
                    }
                    return AppWidget.typeButtonStartAction(
                        context: context,
                        input: 'Sign Up Now',
                        onPressed: () {
                          final AuthenticationModel user = AuthenticationModel(
                            userName: usernameCtl.text,
                            password: passwordCtl.text,
                          );
                          // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            SignUpEvent(newUser: user),
                          );

                          // Navigator.of(context).pushNamed(Routes.signUp);
                        },
                        colorAsset: grey1100,
                        icon: icKeyboardRight,
                        sizeAsset: 24,
                        bgColor: primary,
                        borderColor: primary,
                        textColor: grey1100);
                  },
                ),
                // AppWidget.typeButtonStartAction(
                //     context: context,
                //     input: 'Sign Up Now',
                //     onPressed: () {
                //       final AuthenticationModel user = AuthenticationModel(
                //         userName: usernameCtl.text,
                //         password: passwordCtl.text,
                //       );
                //       // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel
                //       BlocProvider.of<AuthenticationBloc>(context).add(
                //         SignUpEvent(newUser: user),
                //       );
                //       Navigator.of(context).pushNamed(Routes.signUp);
                //     },
                //     colorAsset: grey1100,
                //     icon: icKeyboardRight,
                //     sizeAsset: 24,
                //     bgColor: primary,
                //     borderColor: primary,
                //     textColor: grey1100),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'or Sign Up with social account',
                style: subhead(color: grey600),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Facebook',
                      onPressed: () {},
                      icon: icFacebook,
                      sizeAsset: 24,
                      bgColor: grey200,
                      borderColor: grey200,
                      textColor: grey1100),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Twitter',
                      onPressed: () {},
                      icon: icTwitter,
                      sizeAsset: 24,
                      bgColor: grey200,
                      borderColor: grey200,
                      textColor: grey1100),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                child: Text(
                  'By clicking Sign Up you are agreeing to the Terms of Use and the Privacy Policy',
                  textAlign: TextAlign.center,
                  style: subhead(color: grey600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
