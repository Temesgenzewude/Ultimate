import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/data/models/account_info_model.dart';

import '../../../app/widget_support.dart';
import '../../../common/bloc/account_information/account_information_bloc.dart';
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

final List<String> ethnicities = [
  'African',
  'African American',
  'Asian',
  'Caucasian',
  'Hispanic',
  'Indian',
  'Middle Eastern',
  'Native American',
  'Pacific Islander',
  'Other'
];

final List<String> bornReligions = ['Muslim', 'Revert', 'Other'];

class AccountInformationFour extends StatefulWidget {
  const AccountInformationFour({Key? key}) : super(key: key);

  @override
  State<AccountInformationFour> createState() => _AccountInformationFourState();
}

class _AccountInformationFourState extends State<AccountInformationFour> {
  TextEditingController bornReligiousCtl = TextEditingController();
  FocusNode bornReligiousFn = FocusNode();

  double _upperValueHeight = 100.50;
  final double _minHeight = 0.0;
  final double _maxHeight = 300.50;

  String? _selectedNationality;
  String? _selectedEthnicity;
  String? _selectedBornReligion;

  bool isSmoke = false;
  bool isDrink = false;
  bool isMedication = false;
  bool isSmokeClicked = false;
  bool isDrinkClicked = false;
  bool isMedicationClicked = false;

  @override
  void initState() {
    prefManager.lastViewedPage = Routes.accountInformationFour;

    bornReligiousCtl.text = prefManager.bornReligious ?? '';
    _upperValueHeight = double.tryParse(prefManager.hight ?? '0.0') ?? 0.0;

    _selectedEthnicity = prefManager.ethnicity;
    _selectedNationality = prefManager.nationality;
    _selectedBornReligion = prefManager.bornReligious;

    isMedication = prefManager.isMedication ?? false;
    isDrink = prefManager.isDrink ?? false;
    isSmoke = prefManager.isSmoke ?? false;

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
                '4 of 4',
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
                const SizedBox(height: 20),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Born Religion',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField2(
                      value: _selectedBornReligion,
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
                        'Select Your Born Religion',
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
                      items: bornReligions
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
                          return 'Please select your born religion .';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedBornReligion = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedBornReligion = value;
                        });
                      },
                    ),
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
                          'Height',
                          style: title3(color: grey1100),
                        ),
                        Text(
                          '${_upperValueHeight.toStringAsFixed(2)} cm',
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
                          label: '$_upperValueHeight',
                          min: _minHeight,
                          max: _maxHeight,
                          value: double.tryParse(
                                  _upperValueHeight.toStringAsFixed(2)) ??
                              0.0,
                          onChanged: (double value) {
                            setState(() {
                              _upperValueHeight = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$_minHeight cm',
                          style: footnote(color: grey500),
                        ),
                        Text(
                          '$_maxHeight cm',
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
                      'Ethnicity',
                      style: title3(color: grey1100),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField2(
                      value: _selectedEthnicity,
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
                        'Select Your Ethnicity',
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
                      items: ethnicities
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
                          return 'Please select your ethnicity.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedEthnicity = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedEthnicity = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Select Your Nationality',
                        onPressed: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.blueGrey),
                                bottomSheetHeight:
                                    500, // Optional. Country list modal height
                                //Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                //Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                setState(() {
                                  _selectedNationality = country.name;
                                });
                                print('Select country: ${country.displayName}');
                              });
                        },
                        bgColor: grey200,
                        borderColor: grey200,
                        textColor: Colors.white),
                    Text('${_selectedNationality ?? 'No Nationality Selected'}',
                        style: body(color: grey1100, fontWeight: '600')),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Checkbox(
                            tristate: true,
                            value: isSmoke,
                            fillColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),
                            onChanged: (bool? value) {
                              setState(() {
                                isSmoke = value ?? false;

                                isSmokeClicked = true;
                              });
                            },
                          ),
                          Text(
                            'isSmoke',
                            style: body(color: grey1100, fontWeight: '600'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Checkbox(
                            isError: true,
                            tristate: true,
                            fillColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),
                            value: isDrink,
                            onChanged: (bool? value) {
                              setState(() {
                                isDrink = value ?? false;

                                isDrinkClicked = true;
                              });
                            },
                          ),
                          Text(
                            'isDrink',
                            style: body(color: grey1100, fontWeight: '600'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Checkbox(
                            isError: true,
                            tristate: true,
                            fillColor:
                                MaterialStateProperty.all(Colors.blueGrey),
                            side: const BorderSide(
                                width: 1.0, color: Colors.white),
                            value: isMedication,
                            onChanged: (bool? value) {
                              setState(() {
                                isMedication = value ?? false;

                                isMedicationClicked = true;
                              });
                            },
                          ),
                          Text(
                            'isMedication',
                            style: body(color: grey1100, fontWeight: '600'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                BlocConsumer<AccountInfoBloc, AccInfoState>(
                  listener: (context, state) {
                    if (state is AccInfoSuccessState) {
                      Utils.flutterToast(
                          'Your profile is successfully updated!');

                      // Future.delayed(const Duration(seconds: 2), () {
                      //   Navigator.of(context).pushNamed(Routes.interest_1);
                      // });
                    } else if (state is AccFailureState) {
                      Utils.flutterToast(state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is AccInfoLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is AccInfoSuccessState) {
                      return AppWidget.typeButtonStartAction2(
                          context: context,
                          input: prefManager.userType == 'User A'
                              ? 'CONTINUE TO ADD YOUR INTERESTS'
                              : 'CONTINUE TO FEEDS',
                          onPressed: () {
                            if (prefManager.userType == 'User A') {
                              Navigator.of(context)
                                  .pushNamed(Routes.interest_1);
                            } else if (prefManager.userType == 'User B') {
                              Navigator.of(context).pushNamed(Routes.feed);
                            }
                          },
                          bgColor: primary,
                          borderColor: primary,
                          textColor: grey1100);
                    } else {
                      return AppWidget.typeButtonStartAction2(
                          context: context,
                          input: 'UPDATE YOUR PROFILE',
                          onPressed: () {
                            _validateForm();
                          },
                          bgColor: primary,
                          borderColor: primary,
                          textColor: grey1100);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    // if (bornReligiousCtl.text.isEmpty) {
    //   Utils.flutterToast(
    //       ' Born religious is required . Please your born religious!');
    //   return;
    // }

    if (_selectedBornReligion == null || _selectedBornReligion!.isEmpty) {
      Utils.flutterToast(
          'Born religion is required . Please select your born religion!');
      return;
    }

    if (_upperValueHeight == 0.0) {
      Utils.flutterToast(
          'Valid Height is required. Please select your valid height!');
      return;
    }

    if (_selectedEthnicity == null || _selectedEthnicity!.isEmpty) {
      Utils.flutterToast(
          'Ethnicity is required. Please select your ethnicity!');
      return;
    }
    if (_selectedNationality == null || _selectedNationality!.isEmpty) {
      Utils.flutterToast(
          'Nationality is required. Please select your nationality!');
      return;
    }

    prefManager.bornReligious = _selectedBornReligion;

    prefManager.hight = _upperValueHeight.toStringAsFixed(2);
    prefManager.ethnicity = _selectedEthnicity;
    prefManager.nationality = _selectedNationality;
    prefManager.isDrink = isDrink;
    prefManager.isMedication = isMedication;
    prefManager.isSmoke = isSmoke;

    String address =
        '${prefManager.address}, ${prefManager.address2},${prefManager.address3}, ${prefManager.town}, ${prefManager.state}, ${prefManager.postCode}, ${prefManager.country}';

    print('The address is $address');

    final AccountInfoModel accountInfoModel = AccountInfoModel(
      about: prefManager.about ?? 'About me',
      address: address,
      age: prefManager.age ?? '21',
      bornReligious: _selectedBornReligion ?? 'Muslim',
      nationality: _selectedNationality ?? 'Nationality',
      ethnicity: _selectedEthnicity ?? 'Black American',
      height: _upperValueHeight.toStringAsFixed(2),
      isDrink: isDrink,
      isMadication: isMedication,
      isSmoke: isSmoke,
      profession: prefManager.profession ?? 'Doctor',
      levelOfReligiously: prefManager.levelOfReligiously ?? 'Non Conservative',
      maritalStatus: prefManager.maritalStatus ?? 'Single',
      gender: prefManager.gender ?? 'Male',
      healthIssue: prefManager.healthIssue ?? 'No',
      child: prefManager.child ?? '0',
      lookingFor: prefManager.lookingFor ?? 'Friendship',
      sect: prefManager.sect ?? 'Sunni',
      userId: prefManager.userID ?? '0',
      birthDate: prefManager.birthday ?? '01-01-2000',
    );

    print('accountInfoModel: ${accountInfoModel.toJson()}');

    BlocProvider.of<AccountInfoBloc>(context)
        .add(AddAccInfoEvent(accInfo: accountInfoModel));
  }
}
