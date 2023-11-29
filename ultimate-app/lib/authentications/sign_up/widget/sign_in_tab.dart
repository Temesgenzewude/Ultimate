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
  TextEditingController usernameCtl = TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  bool showPass = false;

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
          const SizedBox(height: 16),
          Column(
            children: [
              TextFieldCpn(
                controller: usernameCtl,
                focusNode: usernameFn,
                labelText: 'Email',
                type: 'email',
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
                    onPressed: () {
                      _handleFacebookSignIn();
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
                      _handleGoogleSignIn();
                    },
                    icon: google,
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

  void _submitForm() {
    if (usernameCtl.text.isEmpty || passwordCtl.text.isEmpty) {
      Utils.flutterToast('Please fill all fields');
      return;
    }
    if (!FormValidator.validateEmail(usernameCtl.text)) {
      Utils.flutterToast('Invalid Email');
      return;
    }

    if (!FormValidator.validatePassword(passwordCtl.text)) {
      Utils.flutterToast('Invalid Password');
      return;
    }
    // If all validation passes
    final UserALoginRequestModel user = UserALoginRequestModel(
      email: usernameCtl.text,
      password: passwordCtl.text,
    );
    BlocProvider.of<AuthenticationBloc>(context).add(
      UserASignInEvent(
        user: user,
      ),
    );
  }
}
