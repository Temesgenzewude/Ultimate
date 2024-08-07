import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';

import '../../../../../app/widget_support.dart';
import '../../../../../common/constant/colors.dart';
import '../../../../../common/constant/images.dart';
import '../../../../../common/constant/styles.dart';
import '../../../../../common/route/routes.dart';
import '../../../../../common/util/form_validator.dart';
import '../../../../../common/util/show_toast_message.dart';
import '../../../../../common/widget/gradient_text.dart';
import '../../../../../common/widget/textfield.dart';
import '../../../../../common/widget/textfield_pass.dart';
import '../../../../../dependency_indjection.dart';
import 'social_login_apis.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> with FormValidator {
  TextEditingController usernameCtl = TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController repasswordCtl = TextEditingController();
  TextEditingController nameCtl = TextEditingController();
  FocusNode nameFn = FocusNode();
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();

  FocusNode repasswordFn = FocusNode();

  bool showPass = false;
  bool showRePass = false;
  String? countryCode = 'US';
  String? languageCode = '+1';
  bool agree = false;

  Future<void> _handleGoogleSignIn() async {
    final user = await SocialLoginApi.googleSignIn();

    if (user == null) {
      Utils.flutterToast('Sign in with Google failed');
    } else {
      Utils.flutterToast('Sign in with Google success');

      print('name: ${user.displayName}');
      print('email: ${user.email}');
      print('photo: ${user.photoUrl}');
      print('id: ${user.id}');
      print('token: $user');

      print('user $user');
    }
  }

  final prefManager = sl<PrefManager>();

  @override
  void initState() {
    // update the initial page in the shared preferences

    // prefManager.lastViewedPage = Routes.signUp;
    usernameCtl.text = prefManager.email ?? '';
    nameCtl.text = prefManager.name ?? '';

    passwordCtl.text = prefManager.password ?? '';
    repasswordCtl.text = prefManager.password ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 20),
            GradientText(
              'Welcome to  Ultimate! Sign Up As User A ',
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
            const SizedBox(height: 16),
            Column(
              children: [
                TextFieldCpn(
                  controller: nameCtl,
                  focusNode: nameFn,
                  labelText: 'Name',
                  type: 'name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFieldCpn(
                    controller: usernameCtl,
                    focusNode: usernameFn,
                    labelText: 'Email',
                    type: 'email',
                  ),
                ),

                TextFieldPassCpn(
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

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Checkbox(
                        value: agree,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) {
                            return agree ? primary : Colors.transparent;
                          },
                        ),
                        onChanged: (value) {
                          setState(() {
                            agree = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'Agree to the terms and conditions',
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Sign Up Now',
                  onPressed: () {
                    _verifyForm();
                    // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel

                    // Navigator.of(context).pushNamed(Routes.signUp);
                  },
                  colorAsset: grey1100,
                  icon: icKeyboardRight,
                  sizeAsset: 24,
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100,
                )
                //   },
                // ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'or Sign Up with social account',
                  style: subhead(color: grey600),
                ),
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
                      input: 'Google',
                      onPressed: () {
                        _handleGoogleSignIn();
                      },
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: RichText(
                  text: TextSpan(
                      text: 'By clicking Sign Up you are agreeing to the ',
                      style: subhead(color: grey600),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Terms of Service and Conditions of Use',
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: grey900),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context)
                                    .pushNamed(Routes.termsAndConditions);
                              })
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyForm() {
    if (!agree) {
      Utils.flutterToast('Please agree to the terms and conditions');
      return;
    }

    if (!FormValidator.validateName(nameCtl.text)) {
      Utils.flutterToast('Name can not be empty');
      return;
    }

    if (usernameCtl.text.isEmpty) {
      Utils.flutterToast('Please enter your email!');
      return;
    }

    if (!FormValidator.validateEmail(usernameCtl.text)) {
      Utils.flutterToast('Invalid Email');
      return;
    }

    if (passwordCtl.text.isEmpty) {
      Utils.flutterToast('Please enter password');
      return;
    }

    if (!FormValidator.validatePassword(passwordCtl.text)) {
      Utils.flutterToast('Invalid Password');
      return;
    }
    if (passwordCtl.text != repasswordCtl.text) {
      Utils.flutterToast('Passwords do not match');
      return;
    }

    prefManager.name = nameCtl.text;
    prefManager.email = usernameCtl.text;

    prefManager.password = passwordCtl.text;

    final formData = {
      'name': nameCtl.text,
      'email': usernameCtl.text,
      'password': passwordCtl.text,
    };

    Navigator.of(context)
        .pushNamed(Routes.addMobileNumber, arguments: formData);
  }
}
