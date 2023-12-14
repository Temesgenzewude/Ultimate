import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/auth/authentication_bloc.dart';

import '../../../../../app/widget_support.dart';

import '../../../../../common/constant/colors.dart';
import '../../../../../common/constant/images.dart';
import '../../../../../common/constant/styles.dart';
import '../../../../../common/route/routes.dart';
import '../../../../../common/util/form_validator.dart';
import '../../../../../common/util/show_toast_message.dart';
import '../../../../../common/widget/animation_click.dart';
import '../../../../../common/widget/gradient_text.dart';
import '../../../../../common/widget/textfield.dart';
import '../../../../../common/widget/unfocus_click.dart';
import '../../../data/models/authentication_model.dart';
import '../../../../../dependency_indjection.dart';
import '../../../../../sharedPreferences.dart';

class AddMobileNumber extends StatefulWidget {
  AddMobileNumber({Key? key}) : super(key: key);

  @override
  State<AddMobileNumber> createState() => _AddMobileNumberState();
}

final prefManager = sl<PrefManager>();

String latitude = prefManager.latitude ?? '0.0';
String longitude = prefManager.longitude ?? '0.0';

class _AddMobileNumberState extends State<AddMobileNumber> {
  /*  Authentication bloc for user type A*/
  BlocConsumer<AuthenticationBloc, AuthenticationState>
      buildUserAAuthenticationBlocConsumer() {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context1, state) {
        print('Auth state listener $state');
        if (state is AuthenticationFailureState) {
          Utils.flutterToast(state.errorMessage);
        } else if (state is AuthenticationSuccessState) {
          Utils.flutterToast(
              'You have successfully registered. OTP is sent to ${prefManager.phone} Please verify your account!');
          // Delay the navigation to the verification screen for 5 seconds
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed(Routes.verify,
                arguments: '${prefManager.phone}');
          });
        }
      },
      builder: (context1, state) {
        print('Auth state builder---- $state');
        if (state is AuthenticationLoadingState) {
          print('Auth state-- loading');
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthenticationSuccessState) {
          print('Auth state---- success');
          return Container();
        } else {
          return AppWidget.typeButtonStartAction(
              context: context,
              input: 'SEND OTP NOW',
              onPressed: () {
                _validatePhoneNumber();
              },
              bgColor: primary,
              // icon: icArrowRight,
              colorAsset: grey1100,
              borderColor: primary,
              textColor: grey1100);
        }
      },
    );
  }

  void _validatePhoneNumber() {
    if (phoneCtl.text.isEmpty) {
      Utils.flutterToast('Please enter phone number');
      return;
    }

    String phoneNumber = phoneCtl.text;
    print(phoneNumber);
    if (!FormValidator.validatePhoneNumber(phoneNumber)) {
      Utils.flutterToast(
          'Invalid Phone number:Please enter a valid phone number!');
      return;
    }
//  If all validation passes
// Save the phone number in the shared preferences
    prefManager.phone = phoneNumber;

    String userRole = 'A';
    if (prefManager.userType == 'User B') {
      userRole = 'B';
    }

    UserSignUpRequestModel userSignUpRequestModel = UserSignUpRequestModel(
      name: prefManager.name ?? 'Test Name',
      password: prefManager.password ?? '12345678',
      email: prefManager.email ?? 'testusera@example.com',
      phoneNumber: phoneNumber,
      coordinates: '$latitude,$longitude',
      user_role: userRole,
      terms: true,
    );

    print(prefManager.userType);
    if (prefManager.userType == 'User A') {
      BlocProvider.of<AuthenticationBloc>(context).add(
        UserASignUpEvent(newUser: userSignUpRequestModel),
      );
    }
  }

  @override
  void initState() {
    // prefManager.lastViewedPage = Routes.addMobileNumber;

    phoneCtl.text = prefManager.phone ?? '';
    super.initState();
  }

  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);

    return UnfocusClick(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                padding: const EdgeInsets.only(top: 64),
                decoration: const BoxDecoration(
                    color: grey200,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: AnimationClick(
                          function: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            icArrowLeft,
                            width: 24,
                            height: 24,
                            color: grey1100,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          logo,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Image.asset(
                        bg1,
                        fit: BoxFit.fill,
                        height: height / 2.5,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            'Add mobile number',
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
                          const SizedBox(height: 8),
                          Text(
                            'Your mobile number',
                            style: body(color: grey800),
                          ),
                          //a
                        ],
                      ),
                    ),
                    TextFieldCpn(
                      controller: phoneCtl,
                      focusNode: phoneFn,
                      hintText: '+2519 245 245 6789',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 32),
                    buildUserAAuthenticationBlocConsumer(),
                    const SizedBox(height: 24)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneCtl.dispose();
    super.dispose();
  }
}
