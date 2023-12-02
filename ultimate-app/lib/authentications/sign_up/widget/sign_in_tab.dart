import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import '../../../data/models/login_request_model.dart';
import 'social_login_apis.dart';

class SignInTab extends StatefulWidget {
  const SignInTab({Key? key}) : super(key: key);

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController phoneNumberCtl = TextEditingController();
  FocusNode phoneNumberFn = FocusNode();
  bool showPass = false;
  bool _logInWithEmail = true;
  bool _logInWithPhone = false;

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

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context)
            .pushReplacementNamed(Routes.accountInformationOne);
      });
    }
  }

  Future<void> _handleFacebookSignIn() async {
    final Map<String, dynamic> user = await SocialLoginApi.facebookSignIn();

    if (!user['status']) {
      Utils.flutterToast('Sign in with Facebook failed');
    } else {
      Utils.flutterToast('Sign in with Facebook success');
      print('facebook user: $user');

      // Future.delayed(const Duration(seconds: 3), () {
      //   Navigator.of(context).pushReplacementNamed(Routes.accountInformation);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 20,
          ),
          GradientText(
            'Welcome to  Ultimate! Login As User A!',
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
          // const SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: <Widget>[
          //     Container(
          //       height: 60,
          //       child: Row(
          //         children: [
          //           Checkbox(
          //             isError: true,
          //             tristate: true,
          //             fillColor: MaterialStateProperty.all(Colors.blueGrey),
          //             side: const BorderSide(width: 1.0, color: Colors.white),
          //             value: _logInWithEmail,
          //             onChanged: (bool? value) {
          //               setState(() {
          //                 _logInWithEmail = value ?? false;

          //                 _logInWithPhone = !_logInWithEmail;
          //               });
          //             },
          //           ),
          //           Text(
          //             'With Email',
          //             style: body(color: grey1100, fontWeight: '600'),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Container(
          //       height: 60,
          //       child: Row(
          //         children: [
          //           Checkbox(
          //             isError: true,
          //             tristate: true,
          //             fillColor: MaterialStateProperty.all(Colors.blueGrey),
          //             side: const BorderSide(width: 1.0, color: Colors.white),
          //             value: _logInWithPhone,
          //             onChanged: (bool? value) {
          //               setState(() {
          //                 _logInWithPhone = value ?? false;

          //                 _logInWithEmail = !_logInWithPhone;
          //               });
          //             },
          //           ),
          //           Text(
          //             'With Phone Number',
          //             style: body(color: grey1100, fontWeight: '600'),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              TextFieldCpn(
                controller: emailCtl,
                focusNode: emailFn,
                labelText: 'Email Or Phone Number',
                type: 'email',
                hintText: 'email or phone number',
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
                  Utils.flutterToast('Successfully logged in');
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.of(context).pushReplacementNamed(Routes.feed);
                  });
                  return AppWidget.typeButtonStartAction(
                    context: context,
                    input: 'Sign In Now',
                    onPressed: () {},
                    colorAsset: grey1100,
                    icon: icKeyboardRight,
                    sizeAsset: 24,
                    bgColor: Colors.grey,
                    borderColor: Colors.grey,
                    textColor: grey1100,
                  );
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
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'or Sign In with social account',
              style: subhead(color: grey600),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: AppWidget.typeButtonStartAction2(
                    context: context,
                    input: 'Facebook',
                    onPressed: () {
                      // _handleFacebookSignIn();
                    },
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
                      // _handleGoogleSignIn();
                    },
                    icon: google,
                    sizeAsset: 24,
                    bgColor: grey200,
                    borderColor: grey200,
                    textColor: grey1100),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    String phoneNumber = '';
    String email = '';

    if (emailCtl.text.isEmpty) {
      Utils.flutterToast(
          'Email or Phone Number is required. Please enter your email or phone number!');
      return;
    }

    if (emailCtl.text.startsWith('+')) {
      if (!FormValidator.validatePhoneNumber(emailCtl.text)) {
        Utils.flutterToast(
            'Invalid Phone number:Please enter a valid phone number!');
        return;
      }
      phoneNumber = emailCtl.text;
    } else {
      if (!FormValidator.validateEmail(emailCtl.text)) {
        Utils.flutterToast('Invalid Email. Please enter valid email!');
        return;
      }
      email = emailCtl.text;
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
    final UserALoginRequestModel user = UserALoginRequestModel(
      email: email,
      password: passwordCtl.text,
      phoneNumber: phoneNumber,
    );

    print('login user body: $user');
    print('email: ${user.email}');
    print('password: ${user.password}');
    print('phone: ${user.phoneNumber}');
    BlocProvider.of<AuthenticationBloc>(context).add(
      UserASignInEvent(
        user: user,
      ),
    );
  }
}
