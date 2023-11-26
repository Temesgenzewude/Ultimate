import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/route/routes.dart';
import '../../../common/util/show_toast_message.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';
import '../../../data/datasources/Auth/auth_remote_data_source.dart';

final List<String> professions = [
  'Student',
  'Professional',
];

class AccountInformationOne extends StatefulWidget {
  const AccountInformationOne({Key? key}) : super(key: key);

  @override
  State<AccountInformationOne> createState() => _AccountInformationOneState();
}

class _AccountInformationOneState extends State<AccountInformationOne> {
  TextEditingController occupationCtl = TextEditingController();

  TextEditingController addressCtl = TextEditingController();
  TextEditingController healthIssueCtl = TextEditingController();
  FocusNode addressFn = FocusNode();
  FocusNode healthIssueFn = FocusNode();

  FocusNode occupationFn = FocusNode();
  int _upperValue = 18;
  int min = 18;
  int max = 100;
  bool isMale = true;
  bool isFemale = false;
  bool isOther = false;
  String? selectedProfession;

  String? _selectedGender;

  @override
  void initState() {
    prefManager.lastViewedPage = Routes.accountInformationOne;

    addressCtl.text = prefManager.address ?? '';
    _upperValue = int.tryParse(prefManager.age ?? '18') ?? 18;
    _selectedGender = prefManager.gender;
    selectedProfession = prefManager.profession;
    healthIssueCtl.text = prefManager.healthIssue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                '1 of 3',
                style: headline(color: corn1),
              ),
            ),
            // function: () {
            //   Navigator.of(context).pushNamed(Routes.interest_1);
            // },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      'Update your personal information!',
                      style: const TextStyle(
                          fontSize: 28,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimationClick(
                          function: () {
                            setState(() {
                              isMale = true;
                              isFemale = false;
                              isOther = false;
                              _selectedGender = 'Male';
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
                                    borderRadius: BorderRadius.circular(60)),
                                child: Image.asset(
                                  male,
                                  width: 30,
                                  height: 30,
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
                              _selectedGender = 'Female';
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
                                    borderRadius: BorderRadius.circular(60)),
                                child: Image.asset(
                                  female,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              Text(
                                'Female',
                                style: subhead(
                                    color: isFemale ? grey1100 : grey600),
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
                              _selectedGender = 'Other';
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
                                    borderRadius: BorderRadius.circular(60)),
                                child: Image.asset(
                                  smiley,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              Text(
                                'Other',
                                style: subhead(
                                    color: isOther ? grey1100 : grey600),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
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
                          min: 18,
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
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profession',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField2(
                      value: selectedProfession,
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
                      items: professions
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
                          selectedProfession = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          selectedProfession = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFieldCpn(
                  controller: addressCtl,
                  focusNode: addressFn,
                  labelText: 'Address',
                  type: 'address',
                ),
                const SizedBox(height: 16),
                TextFieldCpn(
                  controller: healthIssueCtl,
                  focusNode: healthIssueFn,
                  labelText: 'Health Issue',
                  type: 'health issue',
                ),
                const SizedBox(
                  height: 32,
                ),
                AppWidget.typeButtonStartAction2(
                    context: context,
                    input: 'NEXT',
                    onPressed: () {
                      _validateForm();
                    },
                    bgColor: primary,
                    borderColor: primary,
                    textColor: grey1100)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_selectedGender == null || _selectedGender!.isEmpty) {
      Utils.flutterToast('Gender is required. Please select your gender!');
      return;
    }
    if (selectedProfession == null || selectedProfession!.isEmpty) {
      Utils.flutterToast(
          'Profession is required. Please select your profession!');
      return;
    }

    if (addressCtl.text.isEmpty) {
      Utils.flutterToast('Address is required. Please your address!');
      return;
    }

    if (healthIssueCtl.text.isEmpty) {
      Utils.flutterToast('Health issue is required. Please your health issue!');
      return;
    }

    prefManager.address = addressCtl.text;
    prefManager.age = _upperValue.toString();
    prefManager.gender = _selectedGender;
    prefManager.profession = selectedProfession;
    prefManager.healthIssue = healthIssueCtl.text;

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushNamed(Routes.accountInformationTwo);
    });
  }
}

/*

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
*/