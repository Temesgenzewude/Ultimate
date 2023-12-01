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

final List<String> maritalStatus = ['Single', 'Married', 'Divorced', 'Widowed'];
final List<String> levelOfReligiously = [
  'Liberal',
  'Moderate',
  'Conservative'
];

final List<String> sects = [
  'Sunni',
  'Shia',
  'Other',
];

class AccountInformationThree extends StatefulWidget {
  const AccountInformationThree({Key? key}) : super(key: key);

  @override
  State<AccountInformationThree> createState() =>
      _AccountInformationThreeState();
}

class _AccountInformationThreeState extends State<AccountInformationThree> {
  TextEditingController occupationCtl = TextEditingController();

  TextEditingController aboutCtl = TextEditingController();
  TextEditingController healthIssueCtl = TextEditingController();
  FocusNode aboutFn = FocusNode();
  TextEditingController sectCtl = TextEditingController();
  FocusNode sectFn = FocusNode();
  TextEditingController bornReligiousCtl = TextEditingController();
  FocusNode bornReligiousFn = FocusNode();
  FocusNode healthIssueFn = FocusNode();

  FocusNode occupationFn = FocusNode();
  int _upperValueChild = 0;
  final int _minChild = 0;
  final int _maxChild = 20;

  String? _selectedMaritalStatus;
  String? _selectedLevelOfReligiously;
  String? _selectedSect;

  @override
  void initState() {
    prefManager.lastViewedPage = Routes.accountInformationThree;

    aboutCtl.text = prefManager.about ?? '';
    sectCtl.text = prefManager.sect ?? '';

    _upperValueChild = int.parse(prefManager.child ?? '0');
    _selectedMaritalStatus = prefManager.maritalStatus;
    _selectedLevelOfReligiously = prefManager.levelOfReligiously;

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
                '3 of 4',
                style: headline(color: corn1),
              ),
            ),
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
                TextFieldCpn(
                  controller: aboutCtl,
                  focusNode: aboutFn,
                  labelText: 'About',
                  maxLines: 3,
                  hasMutilLine: true,
                  type: 'about',
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Children',
                          style: title3(color: grey1100),
                        ),
                        Text(
                          '$_upperValueChild Children',
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
                          label: '$_upperValueChild',
                          min: 0,
                          max: 20,
                          value: _upperValueChild.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _upperValueChild = value.round();
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$_minChild',
                          style: footnote(color: grey500),
                        ),
                        Text(
                          '$_maxChild',
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
                      'Marital Status',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField2(
                      value: _selectedMaritalStatus,
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
                        'Select Your Marital Status',
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
                      items: maritalStatus
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
                          return 'Please select your marital status.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedMaritalStatus = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedMaritalStatus = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Level of Religiously',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField2(
                      value: _selectedLevelOfReligiously,
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
                        'Select Your Level of Religiously',
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
                      items: levelOfReligiously
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
                          return 'Please select your level of religiously.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedLevelOfReligiously = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedLevelOfReligiously = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sect',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField2(
                      value: _selectedSect,
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
                        'Select Your Sect',
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
                      items: sects
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
                          return 'Please select your sect.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedSect = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedSect = value;
                        });
                      },
                    ),
                  ],
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
    if (aboutCtl.text.isEmpty) {
      Utils.flutterToast('About is required. Please your about!');
      return;
    }

    if (aboutCtl.text.length < 10) {
      Utils.flutterToast('About must be at least 10 characters!');
      return;
    }

    if (_selectedMaritalStatus == null || _selectedMaritalStatus!.isEmpty) {
      Utils.flutterToast(
          'Marital status is required. Please select your marital status!');
      return;
    }

    if (_selectedLevelOfReligiously == null ||
        _selectedLevelOfReligiously!.isEmpty) {
      Utils.flutterToast(
          'Level of religiously is required. Please select your level of religiously!');
      return;
    }

    if (_selectedSect == null || _selectedSect!.isEmpty) {
      Utils.flutterToast('Sect is required. Please select sect!');
      return;
    }

    prefManager.about = aboutCtl.text;
    prefManager.child = _upperValueChild.toString();

    prefManager.maritalStatus = _selectedMaritalStatus;
    prefManager.levelOfReligiously = _selectedLevelOfReligiously;
    prefManager.sect = _selectedSect;

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushNamed(Routes.accountInformationFour);
    });
  }
}
