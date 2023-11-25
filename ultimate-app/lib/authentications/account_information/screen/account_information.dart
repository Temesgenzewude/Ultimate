import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/common/util/show_toast_message.dart';
import 'package:flutter_ultimate/data/datasources/Auth/auth_remote_data_source.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/account_information/account_information_bloc.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/unfocus_click.dart';
import '../../../data/models/account_info_model.dart';

final List<String> genderItems = [
  'Student',
  'Professional',
];

class AccountInformation extends StatefulWidget {
  const AccountInformation({Key? key}) : super(key: key);

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  TextEditingController occupationCtl = TextEditingController();
  FocusNode occupationFn = FocusNode();
  int _upperValue = 18;
  int min = 0;
  int max = 100;
  bool isMale = true;
  bool isFemale = false;
  bool isOther = false;
  String? selectedValue;

  @override
  void initState() {
    prefManager.lastViewedPage = Routes.accountInformation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCpn(
          left: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AnimationClick(
              function: () {
                Navigator.of(context).pop();
              },
              child: Image.asset(
                icArrowLeft,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
          ),
          right: AnimationClick(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                'Skip',
                style: headline(color: corn1),
              ),
            ),
            function: () {
              Navigator.of(context).pushNamed(Routes.interest_1);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(
                    'Update',
                    style: const TextStyle(
                        fontSize: 48,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  ),
                  GradientText(
                    'Infomation',
                    style: const TextStyle(
                        fontSize: 48,
                        height: 1,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SpaceGrotesk'),
                    gradient: LinearGradient(colors: [
                      const Color(0xFFCFE1FD).withOpacity(0.9),
                      const Color(0xFFFFFDE1).withOpacity(0.9),
                    ]),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: title3(color: grey1100),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AnimationClick(
                        function: () {
                          setState(() {
                            isMale = true;
                            isFemale = false;
                            isOther = false;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isMale ? grey1100 : grey200),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset(
                                male,
                                width: 48,
                                height: 48,
                              ),
                            ),
                            Text(
                              'Male',
                              style:
                                  subhead(color: isMale ? grey1100 : grey600),
                            )
                          ],
                        ),
                      ),
                      AnimationClick(
                        function: () {
                          setState(() {
                            isMale = false;
                            isFemale = true;
                            isOther = false;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isFemale ? grey1100 : grey200),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset(
                                female,
                                width: 48,
                                height: 48,
                              ),
                            ),
                            Text(
                              'Female',
                              style:
                                  subhead(color: isFemale ? grey1100 : grey600),
                            )
                          ],
                        ),
                      ),
                      AnimationClick(
                        function: () {
                          setState(() {
                            isMale = false;
                            isFemale = false;
                            isOther = true;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(14),
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isOther ? grey1100 : grey200),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Image.asset(
                                smiley,
                                width: 28,
                                height: 28,
                              ),
                            ),
                            Text(
                              'Other',
                              style:
                                  subhead(color: isOther ? grey1100 : grey600),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Age',
                        style: title3(color: grey1100),
                      ),
                      Text(
                        '$_upperValue Years old',
                        style: headline(color: corn1),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  SliderTheme(
                    data: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                      thumbColor: grey1100,
                      inactiveTrackColor: grey200,
                      activeTrackColor: primary,
                      overlayColor: grey1100,
                    ),
                    child: SizedBox(
                      width: width,
                      child: Slider(
                        label: '$_upperValue',
                        min: 0,
                        max: 100,
                        value: _upperValue.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            _upperValue = value.round();
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$min',
                        style: footnote(color: grey500),
                      ),
                      Text(
                        '$max',
                        style: footnote(color: grey500),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Occupation',
                    style: title3(color: grey1100),
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField2(
                    value: selectedValue,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: grey200,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Your Occupation',
                      style: body(color: grey500),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: grey500,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(right: 16),
                    dropdownDecoration: BoxDecoration(
                      color: grey200,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: body(color: grey600),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select occupation.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BlocBuilder<AccountInfoBloc, AccInfoState>(
                // ignore: unnecessary_parenthesis
                // listener: ((context, state) {
                //   if (state is AccInfoSuccessState) {
                //     Utils.flutterToast('Your profile is successfully updated!');

                //     Future.delayed(const Duration(seconds: 3), () {
                //       Navigator.of(context).pushNamed(Routes.interest_1);
                //     });
                //   } else if (state is AccFailureState) {
                //     Utils.flutterToast(state.errorMessage);
                //   }
                // }),
                builder: (context, state) {
                  if (state is AccInfoLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AccFailureState) {
                    return AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Update Profile',
                        onPressed: () {
                          BlocProvider.of<AccountInfoBloc>(context).add(
                              AddAccInfoEvent(
                                  accInfo: AccountInfoModel(
                                      age: '24',
                                      gender: 'male',
                                      profession: 'Student')));
                        },
                        bgColor: primary,
                        borderColor: primary,
                        textColor: grey1100);
                  } else if (state is AccInfoSuccessState) {
                    Utils.flutterToast('Your profile is successfully updated!');
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pushNamed(context, Routes.interest_1);
                    });
                  } else {
                    return AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Update Profile',
                        onPressed: () {
                          BlocProvider.of<AccountInfoBloc>(context).add(
                              AddAccInfoEvent(
                                  accInfo: AccountInfoModel(
                                      age: '24',
                                      gender: 'male',
                                      profession: 'Student')));
                        },
                        bgColor: primary,
                        borderColor: primary,
                        textColor: grey1100);
                  }
                  return AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Update Profile',
                      onPressed: () {
                        BlocProvider.of<AccountInfoBloc>(context).add(
                            AddAccInfoEvent(
                                accInfo: AccountInfoModel(
                                    age: '24',
                                    gender: 'male',
                                    profession: 'Student')));
                      },
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
