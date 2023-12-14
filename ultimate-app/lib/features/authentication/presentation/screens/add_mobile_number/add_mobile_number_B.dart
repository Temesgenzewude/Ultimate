import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/auth/b/authentication_bloc_b.dart';

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

class AddMobileNumberB extends StatefulWidget {
  AddMobileNumberB({Key? key}) : super(key: key);

  @override
  State<AddMobileNumberB> createState() => _AddMobileNumberBState();
}

final prefManager = sl<PrefManager>();

String latitude = prefManager.latitude ?? '0.0';
String longitude = prefManager.longitude ?? '0.0';

class _AddMobileNumberBState extends State<AddMobileNumberB> {
  /*    Authentication bloc for user type B */
  BlocConsumer<AuthenticationBlocB, AuthenticationBState>
      buildUserBAuthenticationBlocConsumer() {
    return BlocConsumer<AuthenticationBlocB, AuthenticationBState>(
      listener: (context, outerState) {
        // If authentication fails, display the error message
        if (outerState is AuthenticationFailureStateB) {
          Utils.flutterToast(outerState.errorMessage);
        } else if (outerState is AuthenticationSuccessStateB) {
          // If authentication is successful, display a success message and navigate to the verification screen
          Utils.flutterToast(
              'You have successfully registered. OTP is sent to ${phoneCtl.text} Please verify your account!');
          // Delay the navigation to the verification screen for 3 seconds
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacementNamed(Routes.verify,
                arguments: '${prefManager.phone}');
          });
        }
      },
      builder: (context, outerState) {
        if (outerState is AuthenticationLoadingStateB) {
          return const Center(child: CircularProgressIndicator());
        } else if (outerState is AuthenticationSuccessStateB) {
          return Container();
        } else {
          return AppWidget.typeButtonStartAction2(
            context: context,
            input: 'SEND OTP NOW',
            onPressed: () {
              _validatePhoneNumber();
            },
            bgColor: primary,
            borderColor: primary,
            textColor: grey1100,
          );
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

    String userRole = 'B';
    if (prefManager.userType == 'User A') {
      userRole = 'A';
    }

    UserSignUpRequestModel userSignUpRequestModel = UserSignUpRequestModel(
      name: prefManager.name ?? 'Test User B',
      password: prefManager.password ?? '12345678',
      email: prefManager.email ?? 'testuserb@example.com',
      phoneNumber: phoneNumber,
      coordinates: '$latitude,$longitude',
      user_role: userRole,
      terms: true,
    );

    print(prefManager.userType);
    if (prefManager.userType == 'User B') {
      BlocProvider.of<AuthenticationBlocB>(context).add(
        UserBSignUpEvent(newUser: userSignUpRequestModel),
      );
    }
  }

  @override
  void initState() {
    // Set the last viewed page in the preference manager
    // prefManager.lastViewedPage = Routes.addMobileNumberB;

    // Set the text of the phone controller to the saved phone number in the preference manager
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
                    const SizedBox(height: 24),
                    TextFieldCpn(
                      labelText: 'Phone number',
                      controller: phoneCtl,
                      focusNode: phoneFn,
                      type: 'phone',
                      keyboardType: TextInputType.phone,
                      hintText: '+2519 123 456 7890',
                    ),
                    const SizedBox(height: 32),
                    buildUserBAuthenticationBlocConsumer(),
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
