import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield_pass.dart';
import '../../../common/widget/unfocus_click.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController repasswordCtl = TextEditingController();
  FocusNode repasswordFn = FocusNode();
  bool showPass = false;
  bool showRePass = false;

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        backgroundColor: grey200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                bg9,
                height: height / 2.5,
                width: width,
              ),
              Container(
                height: height - height / 2.5,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: const BoxDecoration(
                    color: grey100,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          'Change Password',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Reset code was sent to your email. Please enter the code and create new password.',
                            style: title4(color: grey600),
                          ),
                        )
                      ],
                    ),
                    TextFieldPassCpn(
                        controller: passwordCtl,
                        focusNode: passwordFn,
                        labelText: 'New password',
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
                        labelText: 'Re - New password',
                        showSuffixIcon: true,
                        obscureText: !showRePass,
                        suffixIcon: showRePass ? eye : eyeSlash,
                        colorSuffixIcon: grey500,
                        functionSuffer: () {
                          setState(() {
                            showRePass = !showRePass;
                          });
                        }),
                    AppWidget.typeButtonStartAction(
                        context: context,
                        input: 'Reset Password',
                        onPressed: () {},
                        bgColor: primary,
                        borderColor: primary,
                        textColor: grey1100),
                    Align(
                      alignment: Alignment.center,
                      child: AnimationClick(
                          child: Text(
                        'create an account'.toUpperCase(),
                        style: title4(color: corn1),
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
