import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/otp/otp_bloc.dart';
import '../../../common/bloc/otp/otp_event.dart';
import '../../../common/bloc/otp/otp_state.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/unfocus_click.dart';
import '../../../dependency_indjection.dart';
import '../../../sharedPreferences.dart';

class AddMobileNumber extends StatefulWidget {
  AddMobileNumber({Key? key}) : super(key: key);

  @override
  State<AddMobileNumber> createState() => _AddMobileNumberState();
}

class _AddMobileNumberState extends State<AddMobileNumber> {
  final prefManager = sl<PrefManager>();
  String? countryCode = 'US';
  Future<void> getCountryCode() async {
    double latitude = double.parse(prefManager.kLatitude);
    double longitude = double.parse(prefManager.kLongitude);
    print(latitude);
    print(longitude);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      setState(() {
        countryCode = placemarks[0].isoCountryCode;
      });
    } catch (e) {
      print(e);
    }
  }

  String initialCountry = 'ET';
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();

  @override
  void initState() {
    getCountryCode();
    super.initState();
  }

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
              BlocListener<OtpBloc, OtpState>(
                listener: (context, state) {
                  if (state is OtpSentSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('OTP sent successfully!'),
                      ),
                    );
                    Navigator.pushNamed(context, Routes.verify,
                        arguments: phoneCtl.text);
                  } else if (state is OtpSentFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OTP sending Failed')));
                  }
                },
                child: Container(),
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
                    // TextFieldCpn(
                    //   controller: phoneCtl,
                    //   focusNode: phoneFn,
                    // ),
                    IntlPhoneField(
                      dropdownTextStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
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
                      initialCountryCode: countryCode,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      controller: phoneCtl,
                      focusNode: phoneFn,
                    ),

                    Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: BlocBuilder<OtpBloc, OtpState>(
                          builder: (context, state) {
                            if (state is OtpLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return AppWidget.typeButtonStartAction(
                                  context: context,
                                  input: 'Next',
                                  onPressed: () {
                                    context.read<OtpBloc>().add(OTPSendUserA());
                                  },
                                  bgColor: primary,
                                  icon: icArrowRight,
                                  colorAsset: grey1100,
                                  borderColor: primary,
                                  textColor: grey1100);
                            }
                          },
                        )),
                    AnimationClick(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Not now',
                          style: title4(color: grey1100),
                        ),
                      ),
                      function: () {
                        Navigator.pushNamed(context, Routes.accountInformation);
                      },
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

  @override
  void dispose() {
    phoneCtl.dispose();
    super.dispose();
  }
}
