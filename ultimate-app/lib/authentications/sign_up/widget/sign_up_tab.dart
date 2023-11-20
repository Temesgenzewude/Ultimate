import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/util/show_toast_message.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/auth/authentication_bloc.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/textfield_pass.dart';
import '../../../data/models/authentication_model.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  TextEditingController usernameCtl = new TextEditingController();
  FocusNode usernameFn = FocusNode();
  TextEditingController passwordCtl = new TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController repasswordCtl = new TextEditingController();
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFieldCpn(
                    controller: usernameCtl,
                    focusNode: usernameFn,
                    labelText: 'Email',
                  ),
                ),
                TextFieldCpn(
                  controller: addressCtl,
                  focusNode: addressFn,
                  labelText: 'Address',
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
                  child: TextFieldCpn(
                    controller: phoneCtl,
                    focusNode: phoneFn,
                    labelText: 'Phone',
                    keyboardType: TextInputType.phone,
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

                const SizedBox(height: 32),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AuthenticationSuccessState) {
                      Utils.flutterToast('''You have successfully registered. 
                             Verification email is sent to ${usernameCtl.value.text}
                             Please verify your email address and login!''');

                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.signUp);
                      });
                    } else if (state is AuthenticationFailureState) {
                      return Column(
                        children: [
                          AppWidget.typeButtonStartAction(
                            context: context,
                            input: 'Sign Up Now',
                            onPressed: () {
                              final AuthenticationModel user =
                                  AuthenticationModel(
                                email: usernameCtl.value.text,
                                password: passwordCtl.value.text,
                                name: nameCtl.value.text,
                                address: addressCtl.value.text,
                                phoneNumber: phoneCtl.value.text,
                                coordinates: '10,10',
                                birthDate: birthdayCtl.value.text,
                              );
                              // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                SignUpEvent(newUser: user),
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
                      input: 'Sign Up Now',
                      onPressed: () {
                        final AuthenticationModel user = AuthenticationModel(
                          email: usernameCtl.value.text,
                          password: passwordCtl.value.text,
                          name: nameCtl.value.text,
                          address: addressCtl.value.text,
                          phoneNumber: phoneCtl.value.text,
                          coordinates: '10,10',
                          birthDate: birthdayCtl.value.text,
                        );
                        // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          SignUpEvent(newUser: user),
                        );

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
                // AppWidget.typeButtonStartAction(
                //     context: context,
                //     input: 'Sign Up Now',
                //     onPressed: () {
                //       final AuthenticationModel user = AuthenticationModel(
                //         userName: usernameCtl.text,
                //         password: passwordCtl.text,
                //       );
                //       // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel
                //       BlocProvider.of<AuthenticationBloc>(context).add(
                //         SignUpEvent(newUser: user),
                //       );
                //       Navigator.of(context).pushNamed(Routes.signUp);
                //     },
                //     colorAsset: grey1100,
                //     icon: icKeyboardRight,
                //     sizeAsset: 24,
                //     bgColor: primary,
                //     borderColor: primary,
                //     textColor: grey1100),
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
      ),
    );
  }
}
