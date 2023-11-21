import 'package:flutter/material.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/auth/authentication_bloc.dart';
import 'package:flutter_ultimate/common/route/routes.dart';
import 'package:flutter_ultimate/data/models/login_request_model.dart';


import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/textfield_pass.dart';

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
                style: TextStyle(color: Colors.white),
                dropdownTextStyle: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
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
                  return Column(
                    children: [
                      AppWidget.typeButtonStartAction(
                        context: context,
                        input: 'Sign In Now',
                        onPressed: () {
                          final UserBLoginRequestModel user =
                              UserBLoginRequestModel(
                            phoneNumber: phoneNumberCtl.text,
                            password: passwordCtl.text,
                          );
                          BlocProvider.of<AuthenticationBloc>(context).add(
                            UserBSignInEvent(
                              user: user,
                            ),
                          );
                        },
                        colorAsset: grey1100,
                        icon: icKeyboardRight,
                        sizeAsset: 24,
                        bgColor: primary,
                        borderColor: primary,
                        textColor: grey1100,
                      ),
                      Center(
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Sign In Now',
                  onPressed: () {
                    final UserBLoginRequestModel user = UserBLoginRequestModel(
                      phoneNumber: phoneNumberCtl.text,
                      password: passwordCtl.text,
                    );
                    BlocProvider.of<AuthenticationBloc>(context).add(
                      UserBSignInEvent(
                        user: user,
                      ),
                    );
                  },
                  colorAsset: grey1100,
                  icon: icKeyboardRight,
                  sizeAsset: 24,
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100,
                );
              }),
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
          const SizedBox(),
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
    );
  }
}
