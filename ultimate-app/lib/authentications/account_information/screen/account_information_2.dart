import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/util/form_validator.dart';

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

class AccountInformationTwo extends StatefulWidget {
  const AccountInformationTwo({Key? key}) : super(key: key);

  @override
  State<AccountInformationTwo> createState() => _AccountInformationTwoState();
}

class _AccountInformationTwoState extends State<AccountInformationTwo> {
  TextEditingController address1Ctl = TextEditingController();
  TextEditingController address2Ctl = TextEditingController();
  TextEditingController address3Ctl = TextEditingController();
  TextEditingController townCtl = TextEditingController();
  TextEditingController stateCtl = TextEditingController();
  TextEditingController postalCodeCtl = TextEditingController();
  TextEditingController countryCtl = TextEditingController();

  FocusNode address1Fn = FocusNode();
  FocusNode address2Fn = FocusNode();
  FocusNode address3Fn = FocusNode();
  FocusNode townFn = FocusNode();
  FocusNode stateFn = FocusNode();
  FocusNode postalCodeFn = FocusNode();
  FocusNode countryFn = FocusNode();

  TextEditingController birthdayCtl = TextEditingController();
  FocusNode birthdayFn = FocusNode();

  FocusNode healthIssueFn = FocusNode();

  @override
  void initState() {
    // Set the last viewed page to accountInformationOne
    // prefManager.lastViewedPage = Routes.accountInformationOne;

    // Initialize text controllers with saved values
    birthdayCtl.text = prefManager.birthday ?? '';
    address1Ctl.text = prefManager.address ?? '';
    address2Ctl.text = prefManager.address2 ?? '';
    address3Ctl.text = prefManager.address3 ?? '';
    townCtl.text = prefManager.town ?? '';
    stateCtl.text = prefManager.state ?? '';
    postalCodeCtl.text = prefManager.postCode ?? '';
    countryCtl.text = prefManager.country ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                '2 of 4',
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
                      // 'Update your personal information!',
                      'Enter your personal information!',
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
                TextFieldCpn(
                  controller: birthdayCtl,
                  focusNode: birthdayFn,
                  labelText: 'Birthday(Required)',
                  hintText: '12-12-2000(MM-DD-YYYY)',
                ),
                const SizedBox(height: 16),
                TextFieldCpn(
                  controller: address1Ctl,
                  focusNode: address1Fn,
                  labelText: 'Address 1(Required)',
                  type: 'address',
                ),
                const SizedBox(height: 16),
                TextFieldCpn(
                  controller: address2Ctl,
                  focusNode: address2Fn,
                  labelText: 'Address 2(Optional)',
                  type: 'address 2',
                ),
                TextFieldCpn(
                  controller: address3Ctl,
                  focusNode: address3Fn,
                  labelText: 'Address 3(Optional)',
                  type: 'address 3',
                ),
                TextFieldCpn(
                  controller: townCtl,
                  focusNode: townFn,
                  labelText: 'Town/City(Required)',
                  hintText: 'London',
                  type: 'town/city',
                ),
                TextFieldCpn(
                  controller: stateCtl,
                  focusNode: stateFn,
                  labelText: 'State/Country(Required)',
                  hintText: 'London',
                  type: 'state/country',
                ),
                TextFieldCpn(
                  controller: postalCodeCtl,
                  focusNode: postalCodeFn,
                  labelText: 'Postal Code(Required)',
                  hintText: '1000',
                  type: 'postal code',
                ),
                TextFieldCpn(
                  controller: countryCtl,
                  focusNode: countryFn,
                  hintText: 'United Kingdom',
                  labelText: 'Country(Required)',
                  type: 'country',
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

  // Function to validate the form before proceeding to the next step
  void _validateForm() {
    if (birthdayCtl.text.isEmpty) {
      Utils.flutterToast('Birthday is required. Please enter your birthday!');
      return;
    }

    if (!FormValidator.validateBirthDate(birthdayCtl.text)) {
      Utils.flutterToast('Invalid Birthday: Please enter a valid birthday!');
      return;
    }

    if (address1Ctl.text.isEmpty) {
      Utils.flutterToast('Address is required. Please enter your address!');
      return;
    }

    if (townCtl.text.isEmpty) {
      Utils.flutterToast('Town/City is required. Please enter your town!');
      return;
    }

    if (stateCtl.text.isEmpty) {
      Utils.flutterToast('State/Country is required. Please enter your state!');
      return;
    }

    if (postalCodeCtl.text.isEmpty) {
      Utils.flutterToast('Postal Code is required. Please enter your code!');
      return;
    }

    if (countryCtl.text.isEmpty) {
      Utils.flutterToast('Country is required. Please enter your country!');
      return;
    }

    // Save the form data to shared preferences
    prefManager.address = address1Ctl.text;
    prefManager.address2 = address2Ctl.text;
    prefManager.address3 = address3Ctl.text;
    prefManager.town = townCtl.text;
    prefManager.state = stateCtl.text;
    prefManager.postCode = postalCodeCtl.text;
    prefManager.country = countryCtl.text;
    prefManager.birthday = birthdayCtl.text;

    // Delay the navigation to the next screen for 1 second
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushNamed(Routes.accountInformationThree);
    });
  }
}
