// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/auth/b/authentication_bloc_b.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/util/show_toast_message.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/textfield_pass.dart';
import '../../../data/models/login_request_model.dart';

class SignInTabB extends StatefulWidget {
  const SignInTabB({Key? key}) : super(key: key);

  @override
  State<SignInTabB> createState() => _SignInTabBState();
}

class _SignInTabBState extends State<SignInTabB> {
  TextEditingController phoneNumberBCtl = TextEditingController();
  FocusNode phoneNumberBFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  bool showPass = false;
  String? countryCode = 'US';
  String? languageCode = '+1';
  bool _logInWithEmail = true;
  bool _logInWithPhone = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 20,
          ),
          GradientText(
            'Welcome to  Ultimate! Login As User B',
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
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 60,
                child: Row(
                  children: [
                    Checkbox(
                      isError: true,
                      tristate: true,
                      fillColor: MaterialStateProperty.all(Colors.blueGrey),
                      side: const BorderSide(width: 1.0, color: Colors.white),
                      value: _logInWithEmail,
                      onChanged: (bool? value) {
                        setState(() {
                          _logInWithEmail = value ?? false;

                          _logInWithPhone = !_logInWithEmail;
                        });
                      },
                    ),
                    Text(
                      'With Email',
                      style: body(color: grey1100, fontWeight: '600'),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Checkbox(
                      isError: true,
                      tristate: true,
                      fillColor: MaterialStateProperty.all(Colors.blueGrey),
                      side: const BorderSide(width: 1.0, color: Colors.white),
                      value: _logInWithPhone,
                      onChanged: (bool? value) {
                        setState(() {
                          _logInWithPhone = value ?? false;

                          _logInWithEmail = !_logInWithPhone;
                        });
                      },
                    ),
                    Text(
                      'With Phone Number',
                      style: body(color: grey1100, fontWeight: '600'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          _logInWithEmail
              ? TextFieldCpn(
                  controller: emailCtl,
                  focusNode: emailFn,
                  labelText: 'Email',
                  type: 'email',
                  hintText: 'example123@gmail.com',
                )
              : TextFieldCpn(
                  labelText: 'Phone number',
                  controller: phoneNumberBCtl,
                  focusNode: phoneNumberBFn,
                  type: 'phone',
                  keyboardType: TextInputType.phone,
                  hintText: '+25191234567890',
                ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 32),
            child: TextFieldPassCpn(
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
          ),
          BlocBuilder<AuthenticationBlocB, AuthenticationBState>(
              builder: (context, state) {
            if (state is LoginLoadingStateB) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginSuccessStateB) {
              Utils.flutterToast('Successfully logged in');
              Future.delayed(Duration.zero, () {
                Navigator.of(context).pushReplacementNamed(Routes.feed);
              });
              return AppWidget.typeButtonStartAction(
                context: context,
                input: 'SIGNED IN',
                onPressed: null,
                colorAsset: grey1100,
                icon: icKeyboardRight,
                sizeAsset: 24,
                bgColor: Colors.grey,
                borderColor: Colors.grey,
                textColor: grey1100,
              );
            } else {
              return AppWidget.typeButtonStartAction(
                context: context,
                input: 'Sign In Now',
                onPressed: () {
                  _submitForm();
                },
                colorAsset: grey1100,
                icon: icKeyboardRight,
                sizeAsset: 24,
                bgColor: primary,
                borderColor: primary,
                textColor: grey1100,
              );
            }
          }),
        ],
      ),
    );
  }

  void _submitForm() {
    String phoneNumberB = phoneNumberBCtl.text;
    if (_logInWithPhone) {
      if (phoneNumberBCtl.text.isEmpty) {
        Utils.flutterToast('Phone number is required');
        return;
      }

      if (!FormValidator.validatePhoneNumber(phoneNumberB)) {
        Utils.flutterToast(
            'Invalid Phone number:Please enter a valid phone number!');
        return;
      }
    } else if (_logInWithEmail) {
      if (emailCtl.text.isEmpty) {
        Utils.flutterToast('Email is required. Please enter your email!');
        return;
      }
      if (!FormValidator.validateEmail(emailCtl.text)) {
        Utils.flutterToast('Invalid Email. Please enter valid email!');
        return;
      }
    }

    if (passwordCtl.text.isEmpty) {
      Utils.flutterToast('Password is required. Please enter password!');
      return;
    }

    if (!FormValidator.validatePassword(passwordCtl.text)) {
      Utils.flutterToast('Invalid Password. Please enter valid password!');
      return;
    }
    // If all validation passes
    final UserBLoginRequestModel user = UserBLoginRequestModel(
        phoneNumber: phoneNumberB,
        password: passwordCtl.text,
        email: emailCtl.text);
    BlocProvider.of<AuthenticationBlocB>(context).add(
      UserBSignInEvent(
        user: user,
      ),
    );
  }
}
