import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ultimate/common/util/show_toast_message.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/otp/otp_bloc.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/otp/otp_event.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/otp/otp_state.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import 'package:pinput/pinput.dart';

import '../../../../../app/widget_support.dart';
import '../../../../../common/constant/colors.dart';
import '../../../../../common/constant/images.dart';
import '../../../../../common/constant/styles.dart';
import '../../../../../common/route/routes.dart';
import '../../../../../common/widget/gradient_text.dart';
import '../../../../../common/widget/unfocus_click.dart';

class Verify extends StatefulWidget {
  Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final prefManager = sl<PrefManager>();
  TextEditingController pinController = TextEditingController();
  FocusNode focusNode = FocusNode();
  late Timer _timer;
  int _start = 30;

  String phoneNumber = '';

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void restartTimer() {
    _start = 30;
    startTimer();
  }

  @override
  void initState() {
    startTimer();

    phoneNumber = prefManager.phone ?? '';
    // prefManager.lastViewedPage = Routes.verify;
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return PopScope(
      canPop: false,
      child: UnfocusClick(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: AppWidget.createSimpleAppBar(
          //     context: context,
          //     arrowColor: grey1100,
          //     hasLeading: true,
          //     hasPop: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  bg5,
                  fit: BoxFit.fill,
                  height: height / 4,
                ),
                const Expanded(child: SizedBox()),
                Column(
                  children: [
                    GradientText(
                      'Verify Phone Number',
                      style: const TextStyle(
                          fontSize: 36,
                          height: 40 / 36,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      child: Text(
                        'Enter 4-digit OTP code we sent to ${phoneNumber}',
                        textAlign: TextAlign.center,
                        style: body(color: grey800),
                      ),
                    ),
                    // BlocConsumer to listen for OtpBloc state changes
                    BlocConsumer<OtpBloc, OtpState>(
                      listener: (context, state) {
                        if (state is OtpVerifiedSuccess) {
                          Utils.flutterToast('OTP verified successfully!');

                          if (prefManager.userType == 'User A') {
                            // Navigate to newUploadImages screen for User A
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.accountInformationOne);
                            });
                          } else {
                            // Navigate to newUploadImagesB screen for User B
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.accountInformationOne);
                            });
                          }
                        } else if (state is OtpVerifiedFailure) {
                          Utils.flutterToast(state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is OtpVerifiedLoading) {
                          // Show loading indicator while verifying OTP
                          return const Center(
                            child:
                                Stack(children: [CircularProgressIndicator()]),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    SizedBox(
                      width: width,
                      child: Pinput(
                        onCompleted: (String otp) {
                          if (prefManager.userType == 'User B') {
                            context.read<OtpBloc>().add(OtpVerified(otp));
                          } else {
                            context.read<OtpBloc>().add(OTPVerifyUserA(otp));
                          }
                        },
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        autofocus: true,
                        length: 4,
                        onSubmitted: (String otp) {
                          if (prefManager.userType == 'User B') {
                            context.read<OtpBloc>().add(OtpVerified(otp));
                          } else {
                            context.read<OtpBloc>().add(OTPVerifyUserA(otp));
                          }
                        },
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        defaultPinTheme: PinTheme(
                          width: (width - 60) / 5,
                          height: 60,
                          textStyle: headline(color: grey1100),
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        followingPinTheme: PinTheme(
                          width: (width - 60) / 5,
                          height: 60,
                          textStyle: headline(color: grey500),
                          decoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        disabledPinTheme: PinTheme(
                          width: (width - 60) / 5,
                          height: 60,
                          textStyle: headline(color: grey500),
                          decoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        validator: (pin) {
                          if (pin != null) {
                            return null;
                          }
                          return 'Pin is incorrect';
                        },
                        controller: pinController,
                        focusNode: focusNode,
                      ),
                    ),
                    BlocConsumer<OtpBloc, OtpState>(
                      listener: (context, state) {
                        if (state is OtpSentSuccess) {
                          Utils.flutterToast('OTP sent successfully!');
                        }
                        if (state is OtpSentFailure) {
                          Utils.flutterToast(state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is OtpLoading) {
                          return const Center(
                            child:
                                Stack(children: [CircularProgressIndicator()]),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 16),
                          child: AppWidget.typeButtonStartAction(
                              context: context,
                              input: _start != 0
                                  ? '${_start}s resend code'
                                  : 'Resend code',
                              onPressed: _start != 0
                                  ? () {}
                                  : () {
                                      if (prefManager.userType == 'User B') {
                                        context.read<OtpBloc>().add(OtpSent());
                                      } else {
                                        context
                                            .read<OtpBloc>()
                                            .add(OTPSendUserA());
                                      }
                                      restartTimer();
                                    },
                              bgColor: _start != 0 ? grey200 : primary,
                              borderColor: _start != 0 ? grey200 : primary,
                              textColor: _start != 0 ? grey600 : grey1100),
                        );
                      },
                    ),
                  ],
                ),
                // AppWidget.typeButtonStartAction(
                //     context: context,
                //     input: 'Change the phone number',
                //     onPressed: () {
                //       if (_start == 0) {
                //         if (prefManager.userType == 'User B') {
                //           Navigator.pushNamed(context, Routes.addMobileNumberB);
                //         } else {
                //           Navigator.pushNamed(context, Routes.addMobileNumber);
                //         }
                //       }
                //     },
                //     bgColor: grey100,
                //     borderColor: grey100,
                //     textColor: grey1100),
                const Expanded(flex: 3, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
