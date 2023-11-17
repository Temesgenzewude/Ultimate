import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/gradient_text.dart';
import '../../../common/widget/textfield.dart';
import '../../../common/widget/unfocus_click.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final List<Map<String, String>> items = [
    {
      'icon': cardHolder,
      'title': 'Return on Equity',
      'subTitle':
          'Why would I want to trade an Event Contract over asset class?'
    },
    {
      'icon': cardHolder,
      'title': 'Return on Equity',
      'subTitle':
          'Why would I want to trade an Event Contract over asset class?'
    }
  ];
  TextEditingController phoneCtl = TextEditingController();
  FocusNode phoneFn = FocusNode();
  Widget item(String icon, String title, String subTitle, double width) {
    return Container(
      width: width / 1.2,
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(color: grey200, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.asset(icon, width: 24, height: 24),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: headline(color: grey1100),
                ),
                Text(
                  subTitle,
                  maxLines: 2,
                  style: subhead(color: grey500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return UnfocusClick(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        'Register',
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
                      TextFieldCpn(
                        labelText: 'Enter your phone number',
                        labelStyle: title4(color: grey1100),
                        controller: phoneCtl,
                        focusNode: phoneFn,
                        hintText: 'Phone number',
                      ),
                      AppWidget.typeButtonStartAction(
                          context: context,
                          input: 'Continue',
                          onPressed: () {},
                          bgColor: primary,
                          borderColor: primary,
                          textColor: grey1100),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                    color: grey200,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'or',
                                style: body(color: grey600),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 2,
                                decoration: BoxDecoration(
                                    color: grey200,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimationClick(
                          child: Image.asset(
                            apple,
                            height: 48,
                            width: 48,
                          ),
                        ),
                        AnimationClick(
                          child: Image.asset(
                            google,
                            height: 48,
                            width: 48,
                          ),
                        ),
                        AnimationClick(
                          child: Image.asset(
                            facebook,
                            height: 48,
                            width: 48,
                          ),
                        ),
                        AnimationClick(
                          child: Image.asset(
                            twitter,
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 98,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) => AnimationClick(
                                    child: item(
                                        items[index]['icon']!,
                                        items[index]['title']!,
                                        items[index]['subTitle']!,
                                        width),
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: items.length),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        AnimationClick(
                            child: Text(
                          'Sign in!'.toUpperCase(),
                          style: title4(color: corn1),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
