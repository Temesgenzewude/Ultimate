import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/bloc/otp/otp_bloc.dart';
import 'package:flutter_ultimate/common/bloc/otp/otp_event.dart';
import 'package:flutter_ultimate/data/repositories/auth/auth_repo.dart';
import 'package:flutter_ultimate/dependency_indjection.dart';
import 'package:flutter_ultimate/sharedPreferences.dart';
import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';

class AddMobileNumber extends StatefulWidget {
  final prefManager = sl<PrefManager>();
  AddMobileNumber({Key? key}) : super(key: key);

  @override
  State<AddMobileNumber> createState() => _AddMobileNumberState();
}

class _AddMobileNumberState extends State<AddMobileNumber> {
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width,
                padding: const EdgeInsets.only(top: 64),
                decoration: const BoxDecoration(
                    color: grey200,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          logo,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Image.asset(
                        bg1,
                        fit: BoxFit.fill,
                        height: height / 2.5,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            'Add mobile number',
                            style: const TextStyle(
                                fontSize: 36,
                                height: 40 / 36,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'SpaceGrotesk'),
                            gradient: LinearGradient(colors: [
                              const Color(0xFFCFE1FD).withOpacity(0.9),
                              const Color(0xFFFFFDE1).withOpacity(0.9),
                            ]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your mobile number',
                            style: body(color: grey800),
                          ),
                        ],
                      ),
                    ),
                    TextFieldCpn(
                      controller: phoneCtl,
                      focusNode: phoneFn,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: AppWidget.typeButtonStartAction(
                          context: context,
                          input: 'Next',
                          onPressed: () {
                            context.read<OtpBloc>().add(OtpSent(
                                phoneCtl.text, widget.prefManager.kUserID));
                            Navigator.pushNamed(context, Routes.verify,
                                arguments: phoneCtl.text);
                          },
                          bgColor: primary,
                          icon: icArrowRight,
                          colorAsset: grey1100,
                          borderColor: primary,
                          textColor: grey1100),
                    ),
                    AnimationClick(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Not now',
                          style: title4(color: grey1100),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24)
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
