import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/util/show_toast_message.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/textfield_pass.dart';
import '../../../dependency_indjection.dart';
import '../../../sharedPreferences.dart';

class SignUpTabB extends StatefulWidget {
  const SignUpTabB({Key? key}) : super(key: key);

  @override
  State<SignUpTabB> createState() => _SignUpTabBState();
}

class _SignUpTabBState extends State<SignUpTabB> {
  TextEditingController usernameCtl = TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController repasswordCtl = TextEditingController();
  TextEditingController nameCtl = TextEditingController();
  FocusNode nameFn = FocusNode();

  FocusNode repasswordFn = FocusNode();

  bool showPass = false;
  bool showRePass = false;
  bool agree = false;

  final prefManager = sl<PrefManager>();

  @override
  void initState() {
    // Update the initial page in the shared preferences
    prefManager.lastViewedPage = Routes.signUpB;

    // Set the text of the username field to the saved email in shared preferences
    usernameCtl.text = prefManager.email ?? '';

    // Set the text of the name field to the saved name in shared preferences
    nameCtl.text = prefManager.name ?? '';

    // Set the text of the password field to the saved password in shared preferences
    passwordCtl.text = prefManager.password ?? '';

    // Set the text of the re-password field to the saved password in shared preferences
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
            const SizedBox(height: 16),
            GradientText(
              'Welcome to  Ultimate! Sign Up as User B',
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
            const SizedBox(height: 10),
            Column(
              children: [
                TextFieldCpn(
                  controller: nameCtl,
                  focusNode: nameFn,
                  labelText: 'Name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFieldCpn(
                    controller: usernameCtl,
                    focusNode: usernameFn,
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 16,
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
                    _submitForm();
                    // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel

                    // Navigator.of(context).pushNamed(Routes.signUp);
                  },
                  colorAsset: grey1100,
                  icon: icKeyboardRight,
                  sizeAsset: 24,
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100,
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
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

  // Function to submit the form
  void _submitForm() {
    // Check if the user has agreed to the terms and conditions
    if (!agree) {
      Utils.flutterToast('Please agree to the terms and conditions');
      return;
    }

    // Validate the name field
    if (!FormValidator.validateName(nameCtl.text)) {
      Utils.flutterToast('Name can not be empty');
      return;
    }

    // Check if the email field is empty
    if (usernameCtl.text.isEmpty) {
      Utils.flutterToast('Please enter your email!');
      return;
    }

    // Validate the email format
    if (!FormValidator.validateEmail(usernameCtl.text)) {
      Utils.flutterToast('Invalid Email');
      return;
    }

    // Check if the password field is empty
    if (passwordCtl.text.isEmpty) {
      Utils.flutterToast('Please enter password');
      return;
    }

    // Validate the password format
    if (!FormValidator.validatePassword(passwordCtl.text)) {
      Utils.flutterToast('Invalid Password');
      return;
    }

    // Check if the password and re-entered password match
    if (passwordCtl.text != repasswordCtl.text) {
      Utils.flutterToast('Passwords do not match');
      return;
    }

    // Save the user's name, email, and password in shared preferences
    prefManager.name = nameCtl.text;
    prefManager.email = usernameCtl.text;
    prefManager.password = passwordCtl.text;

    // Create a form data object with the user's information
    final formData = {
      'name': nameCtl.text,
      'email': usernameCtl.text,
      'password': passwordCtl.text,
    };

    // Create a form data object with the user's information from shared preferences
    final fromPref = {
      'name': prefManager.name,
      'email': prefManager.email,
      'password': prefManager.password,
    };

    // Print the user's information from shared preferences
    print('sign up user b data from pref mngr: $fromPref');

    // Print the user's information from the form
    print('sign up user b data: $formData');

    // Navigate to the next screen with the form data as arguments
    Navigator.of(context).pushNamed(Routes.addMobileNumberB, arguments: formData);
  }
}
