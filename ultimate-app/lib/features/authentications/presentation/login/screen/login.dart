import 'package:flutter/material.dart';

import '../../../../../app/widget_support.dart';
import '../../../../../common/constant/colors.dart';
import '../../../../../common/constant/images.dart';
import '../../../../../common/constant/styles.dart';
import '../../../../../common/widget/animation_click.dart';
import '../../../../../common/widget/gradient_text.dart';
import '../../../../../common/widget/textfield.dart';
import '../../../../../common/widget/textfield_pass.dart';
import '../../../../../common/widget/unfocus_click.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameCtl = TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  bool showRePass = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                height: height / 1.3,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            logo,
                            width: 80,
                            height: 80,
                          ),
                          AnimationClick(
                              child: Text(
                            'Sign Up Now!',
                            style: title4(color: corn1),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    GradientText(
                      'Welcome Back Friends!',
                      style: const TextStyle(
                          fontSize: 48,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                    Text(
                      'Login now!',
                      style: body(color: grey800),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: TextFieldCpn(
                        controller: usernameCtl,
                        focusNode: usernameFn,
                        hintText: 'Username',
                        showPrefixIcon: true,
                        prefixIcon: user,
                      ),
                    ),
                    TextFieldPassCpn(
                        controller: passwordCtl,
                        focusNode: passwordFn,
                        hintText: 'Password',
                        showSuffixIcon: true,
                        obscureText: !showRePass,
                        showPrefixIcon: true,
                        prefixIcon: key,
                        suffixIcon: showRePass ? eye : eyeSlash,
                        colorSuffixIcon: grey500,
                        functionSuffer: () {
                          setState(() {
                            showRePass = !showRePass;
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                checkColor: grey100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      width: 1.0, color: grey500),
                                ),
                                focusColor: primary,
                                activeColor: primary,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Save login',
                              style: body(color: grey1100),
                            ),
                          ],
                        ),
                        AnimationClick(
                            child: Text(
                          'Forgot Password?',
                          style: body(color: grey1100),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppWidget.typeButtonStartAction(
                              context: context,
                              input: 'Login',
                              onPressed: () {},
                              bgColor: primary,
                              icon: icArrowRight,
                              colorAsset: grey1100,
                              borderColor: primary,
                              textColor: grey1100),
                        ),
                        const SizedBox(width: 8),
                        AnimationClick(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(color: primary),
                                color: grey100),
                            child: Image.asset(
                              fingerSimple,
                              width: 28,
                              height: 28,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -height / 4.5,
                right: -width / 4,
                child: IgnorePointer(
                  child: Image.asset(
                    bg2,
                    height: height / 1.8,
                    width: width * 1.2,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
