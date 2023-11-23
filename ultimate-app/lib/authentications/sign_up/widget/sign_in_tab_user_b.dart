import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/auth/authentication_bloc.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
          Column(
            children: [
              IntlPhoneField(
                onCountryChanged: (value) {
                  setState(() {
                    languageCode = value.dialCode;
                  });
                },
                style: const TextStyle(color: Colors.white),
                dropdownTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  floatingLabelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  counterStyle: TextStyle(color: Colors.white),
                  suffixIconColor: Colors.white,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIconColor: Colors.white,
                  prefixStyle: TextStyle(color: Colors.white),
                  suffixStyle: TextStyle(color: Colors.white),
                  labelText: 'Phone Number',
                  iconColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: countryCode.toString(),
                // languageCode: countryCode.toString(),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                controller: phoneNumberCtl,
                focusNode: phoneNumberFn,
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
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                if (state is LoginLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoginSuccessState) {
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.addMobileNumber);
                  });
                } else if (state is LoginFailureState) {
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
        ],
      ),
    );
  }

  void _submitForm() {
    print('${languageCode}${phoneNumberCtl.text}');
    print(passwordCtl.text);
    if (!FormValidator.validateName('${languageCode}${phoneNumberCtl.text}')) {
      Utils.flutterToast(
          'Invalid Phone Number: Please enter a valid phone number!');
      return;
    }

    if (!FormValidator.validatePassword(passwordCtl.text)) {
      Utils.flutterToast('Invalid Password');
      return;
    }
    // If all validation passes
    final UserBLoginRequestModel user = UserBLoginRequestModel(
      phoneNumber: '${languageCode}${phoneNumberCtl.text}',
      password: passwordCtl.text,
    );
    BlocProvider.of<AuthenticationBloc>(context).add(
      UserBSignInEvent(
        user: user,
      ),
    );
  }
}
