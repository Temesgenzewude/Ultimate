// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/auth/b/authentication_bloc_b.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/route/routes.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/util/show_toast_message.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield_pass.dart';
import '../../../data/models/login_request_model.dart';

class SignInTabB extends StatefulWidget {
  const SignInTabB({Key? key}) : super(key: key);

  @override
  State<SignInTabB> createState() => _SignInTabBState();
}

class _SignInTabBState extends State<SignInTabB> {
  TextEditingController phoneNumberCtl = TextEditingController();
  FocusNode phoneNumberFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  bool showPass = false;
  String? countryCode = 'US';
  String? languageCode = '+1';

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
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: phoneNumberCtl,
                decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 149, 144, 144),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: '+251 903193236'),
              ),
            ],
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
              Future.delayed(Duration.zero, () {
                Navigator.of(context).pushReplacementNamed(Routes.feed);
              });
            } else if (state is LoginFailureStateB) {
              print(" Error message: ${state.errorMessage}");
              Utils.flutterToast(state.errorMessage);
              return Column(
                children: [
                  AppWidget.typeButtonStartAction(
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
                  ),
                ],
              );
            }
            return Column(
              children: [
                AppWidget.typeButtonStartAction(
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
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  void _submitForm() {
    if (passwordCtl.text.isEmpty) {
      Utils.flutterToast('Password is required');
      return;
    }

    if (phoneNumberCtl.text.isEmpty) {
      Utils.flutterToast('Phone number is required');
      return;
    }

    String phoneNumber = phoneNumberCtl.text;

    if (!FormValidator.validatePhoneNumber(phoneNumber)) {
      Utils.flutterToast(
          'Invalid Phone number:Please enter a valid phone number!');
      return;
    }

    if (!FormValidator.validatePassword(passwordCtl.text)) {
      Utils.flutterToast('Invalid Password');
      return;
    }
    // If all validation passes
    final UserBLoginRequestModel user = UserBLoginRequestModel(
      phoneNumber: phoneNumber,
      password: passwordCtl.text,
    );
    BlocProvider.of<AuthenticationBlocB>(context).add(
      UserBSignInEvent(
        user: user,
      ),
    );
  }
}
