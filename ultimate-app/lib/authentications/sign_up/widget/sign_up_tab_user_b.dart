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
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();
  TextEditingController locationCtl = TextEditingController();
  FocusNode locationFn = FocusNode();
  FocusNode repasswordFn = FocusNode();
  TextEditingController birthdayCtl = TextEditingController();
  FocusNode birthdayFn = FocusNode();
  bool showPass = false;
  bool showRePass = false;
  String? countryCode = 'US';
  String? languageCode = '+1';

  TextEditingController aboutCtl = TextEditingController();
  FocusNode aboutFn = FocusNode();

  TextEditingController ageCtl = TextEditingController();
  FocusNode ageFn = FocusNode();

  List<String> genders = ['Male', 'Female'];

  String? _selectedGender;

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

                TextFieldCpn(
                  controller: ageCtl,
                  focusNode: ageFn,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: false),
                  labelText: 'Age',
                ),

                // select gender
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey200),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          isDense: true,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          hint: const Text(
                            'Select Gender',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          dropdownColor: primary,
                          icon: const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          items: genders.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            );
                          }).toList(),
                          value: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                    )),

                TextFieldCpn(
                  controller: aboutCtl,
                  focusNode: aboutFn,
                  labelText: 'About',
                  hasMutilLine: true,
                  maxLines: 3,
                ),

                TextFieldCpn(
                  controller: locationCtl,
                  focusNode: locationFn,
                  labelText: 'Location',
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

    if (_selectedGender == null) {
      Utils.flutterToast('Please select gender!');
      return;
    }
    if (phoneCtl.text == '') {
      Utils.flutterToast('Please provide a phone number');
      return;
    }

    // If all validation passes
    final UserBModel user = UserBModel(
      email: usernameCtl.value.text,
      password: passwordCtl.value.text,
      name: nameCtl.value.text,
      phoneNumber: '${languageCode}${phoneCtl.value.text}',
      birthDate: birthdayCtl.value.text,
      age: ageCtl.value.text,
      gender: _selectedGender ?? 'Male',
      location: '10,10',
      about: aboutCtl.value.text,
    );

    BlocProvider.of<AuthenticationBloc>(context).add(
      UserBSignUpEvent(newUser: user),
    );
  }
}


/*

   BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is AuthenticationSuccessState) {
                      Utils.flutterToast('''You have successfully registered. 
                             Verification email is sent to ${usernameCtl.value.text}
                             Please verify your email location and login!''');


                AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Sign Up Now',
                  onPressed: () {
                    _submitForm();

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
                              final UserBModel user = UserBModel(
                                  email: usernameCtl.value.text,
                                  password: passwordCtl.value.text,
                                  name: nameCtl.value.text,
                                  about: aboutCtl.value.text,
                                  phoneNumber: phoneCtl.value.text,
                                  location: '10,10',
                                  birthDate: birthdayCtl.value.text,
                                  age: ageCtl.value.text,
                                  gender: _selectedGender!);
                              // Dispatch SignUpEvent to Authentication Bloc with AuthenticationModel
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                UserBSignUpEvent(newUser: user),
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
                        final UserBModel user = UserBModel(
                            email: usernameCtl.value.text,
                            password: passwordCtl.value.text,
                            name: nameCtl.value.text,
                            about: aboutCtl.value.text,
                            phoneNumber: phoneCtl.value.text,
                            location: '10,10',
                            birthDate: birthdayCtl.value.text,
                            age: ageCtl.value.text,
                            gender: _selectedGender!);
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          UserBSignUpEvent(newUser: user),
                        );
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
             
             
             
             
*/ 
