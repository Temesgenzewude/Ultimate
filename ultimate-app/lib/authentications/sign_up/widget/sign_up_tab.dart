import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/auth/authentication_bloc.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/util/form_validator.dart';
import '../../../common/util/show_toast_message.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/textfield_pass.dart';
import '../../../data/models/authentication_model.dart';
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
  TextEditingController addressCtl = TextEditingController();
  FocusNode addressFn = FocusNode();
  FocusNode repasswordFn = FocusNode();
  TextEditingController birthdayCtl = TextEditingController();
  FocusNode birthdayFn = FocusNode();
  bool showPass = false;
  bool showRePass = false;
  String? countryCode = 'US';
  String? languageCode = '+1';

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
              'Welcome to  Ultimate!',
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
                TextFieldCpn(
                  controller: addressCtl,
                  focusNode: addressFn,
                  labelText: 'Address',
                  type: 'address',
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldCpn(
                  controller: birthdayCtl,
                  focusNode: birthdayFn,
                  labelText: 'Birthday',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: IntlPhoneField(
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
                    controller: phoneCtl,
                    focusNode: phoneFn,
                  ),

                  // child: TextFieldCpn(
                  //   controller: phoneCtl,
                  //   focusNode: phoneFn,
                  //   labelText: 'Phone',
                  //   keyboardType: TextInputType.phone,
                  // ),
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
                const SizedBox(height: 32),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AuthenticationSuccessState) {
                      Utils.flutterToast('''You have successfully registered. 
                             OTP is sent to +${languageCode}${phoneCtl.text}
                             Please verify your account!''');

                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.of(context).pushReplacementNamed(
                            Routes.verify,
                            arguments: '+${languageCode}${phoneCtl.text}');
                      });
                    } else if (state is AuthenticationFailureState) {
                      Utils.flutterToast(state.errorMessage);
                      return Column(
                        children: [
                          AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Sign Up Now',
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
                    return AppWidget.typeButtonStartAction(
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
                    );
                  },
                ),
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
      ),
    );
  }

  void _submitForm() {
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
    if (phoneCtl.text.isEmpty) {
      Utils.flutterToast('Please provide a phone number');
      return;
    }

    String phoneNumber = '+' + languageCode! + phoneCtl.text;
    print(phoneNumber);
    if (!FormValidator.validatePhoneNumber(phoneNumber)) {
      Utils.flutterToast(
          'Invalid Phone number:Please enter a valid phone number!');
      return;
    }

    // If all validation passes
    final UserAModel user = UserAModel(
      email: usernameCtl.value.text,
      password: passwordCtl.value.text,
      name: nameCtl.value.text,
      address: addressCtl.value.text,
      phoneNumber: phoneNumber,
      coordinates: '10,10',
      birthDate: birthdayCtl.value.text,
    );

    BlocProvider.of<AuthenticationBloc>(context).add(
      UserASignUpEvent(newUser: user),
    );
  }
}
