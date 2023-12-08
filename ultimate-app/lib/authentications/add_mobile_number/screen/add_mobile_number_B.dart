import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/auth/authentication_bloc.dart';
import '../../../common/bloc/auth/b/authentication_bloc_b.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/util/show_toast_message.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';
import '../../../data/models/authentication_model.dart';
import '../../../dependency_indjection.dart';
import '../../../sharedPreferences.dart';

class AddMobileNumberB extends StatefulWidget {
  AddMobileNumberB({Key? key}) : super(key: key);

  @override
  State<AddMobileNumberB> createState() => _AddMobileNumberBState();
}

final prefManager = sl<PrefManager>();
final String name = prefManager.name ?? '';
final String email = prefManager.email ?? '';
final String address = prefManager.address ?? '';
final String birthday = prefManager.birthday ?? '';
final String password = prefManager.password ?? '';
double latitude = double.tryParse(prefManager.latitude ?? '0.0') ?? 0.0;
double longitude = double.tryParse(prefManager.longitude ?? '0.0') ?? 0.0;

class _AddMobileNumberBState extends State<AddMobileNumberB> {
  void _submitForm({
    required String name,
    required String email,
    required String password,
  }) {
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

    prefManager.phone = phoneNumber;

    //  If all validation passes
    final UserAModel user = UserAModel(
      email: email,
      password: password,
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      coordinates: '10,10',
      birthDate: '12-12-2015',
    );

    final UserBModel userB = UserBModel(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
        location: '10,10',
        birthDate: '12-12-2015',
        about: 'About me',
        terms: true,
        age: '21');

    print(prefManager.userType);
    if (prefManager.userType == 'User B') {
      BlocProvider.of<AuthenticationBlocB>(context).add(
        UserBSignUpEvent(newUser: userB),
      );
    } else {
      BlocProvider.of<AuthenticationBloc>(context).add(
        UserASignUpEvent(newUser: user),
      );
    }
  }

  Widget getAuthWidget() {
    // Listen to the authentication bloc for state changes
    return BlocListener<AuthenticationBlocB, AuthenticationBState>(
      listener: (context, state) {
        // If authentication fails, display the error message
        if (state is AuthenticationFailureStateB) {
          Utils.flutterToast(state.errorMessage);
        }
        // If authentication is successful, display a success message and navigate to the verification screen
        else if (state is AuthenticationSuccessStateB) {
          Utils.flutterToast(
              'You have successfully registered. OTP is sent to ${phoneCtl.text} Please verify your account!');
          // Delay the navigation to the verification screen for 5 seconds
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.of(context).pushReplacementNamed(Routes.verify,
                arguments: '${phoneCtl.text}');
          });
        }
      },
      // An empty container is returned as the child widget
      child: Container(),
    );
  }

  @override
  void initState() {
    // Set the last viewed page in the preference manager
    prefManager.lastViewedPage = Routes.addMobileNumberB;

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

    // final formData =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // Access the individual form fields
    // final String name = formData['name'] ?? '';
    // final String email = formData['email'] ?? '';
    // final String address = formData['address'] ?? '';
    // final String birthday = formData['birthday'] ?? '';
    // final String password = formData['password'] ?? '';

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
              // BlocListener<OtpBloc, OtpState>(
              //   listener: (context, state) {
              //     if (state is OtpSentSuccess) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           content: Text('OTP sent successfully!'),
              //         ),
              //       );
              //       Navigator.pushNamed(context, Routes.verify,
              //           arguments: phoneCtl.text);
              //     } else if (state is OtpSentFailure) {
              //       Utils.flutterToast(state.message);
              //     }
              //   },
              //   child: Container(),
              // ),
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

                    getAuthWidget(),
                    const SizedBox(height: 32),

                    BlocBuilder<AuthenticationBlocB, AuthenticationBState>(
                      builder: (context, state) {
                        if (state is AuthenticationLoadingStateB) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is AuthenticationSuccessStateB) {
                          return Container();
                        } else {
                          return AppWidget.typeButtonStartAction(
                              context: context,
                              input: 'SIGN UP NOW',
                              onPressed: () {
                                _submitForm(
                                  name: name,
                                  email: email,
                                  password: password,
                                );
                                // if (prefManager.userType == 'User A') {
                                //   context.read<OtpBloc>().add(OTPSendUserA());
                                // } else {
                                //   context.read<OtpBloc>().add(OtpSent());
                                // }
                              },
                              bgColor: primary,
                              icon: icArrowRight,
                              colorAsset: grey1100,
                              borderColor: primary,
                              textColor: grey1100);
                        }
                      },
                    ),
                    // AnimationClick(
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Text(
                    //       'Not now',
                    //       style: title4(color: grey1100),
                    //     ),
                    //   ),
                    //   function: () {
                    //     Navigator.pushNamed(context, Routes.accountInformation);
                    //   },
                    // ),
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
