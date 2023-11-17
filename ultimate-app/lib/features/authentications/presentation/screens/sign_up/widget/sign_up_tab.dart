import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/route/routes.dart';

import '../../../../../../app/widget_support.dart';
import '../../../../../../common/constant/colors.dart';
import '../../../../../../common/constant/images.dart';
import '../../../../../../common/constant/styles.dart';
import '../../../../../../common/widget/gradient_text.dart';
import '../../../../../../common/widget/textfield.dart';
import '../../../../../../common/widget/textfield_pass.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  TextEditingController usernameCtl = TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController repasswordCtl = TextEditingController();
  FocusNode repasswordFn = FocusNode();
  bool showPass = false;
  bool showRePass = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GradientText(
            'Welcom to  Ultimate!',
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
              TextFieldCpn(
                controller: usernameCtl,
                focusNode: usernameFn,
                labelText: 'Username',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
              TextFieldPassCpn(
                  controller: repasswordCtl,
                  focusNode: repasswordFn,
                  labelText: 'Re Password',
                  showSuffixIcon: true,
                  obscureText: !showRePass,
                  suffixIcon: showRePass ? eye : eyeSlash,
                  colorSuffixIcon: grey500,
                  functionSuffer: () {
                    setState(() {
                      showRePass = !showRePass;
                    });
                  }),
              const SizedBox(height: 32),
              AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Sign Up Now',
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.addMobileNumber);
                  },
                  colorAsset: grey1100,
                  icon: icKeyboardRight,
                  sizeAsset: 24,
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100),
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
