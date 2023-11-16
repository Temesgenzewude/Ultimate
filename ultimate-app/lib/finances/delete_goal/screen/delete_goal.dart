import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/gradient_text.dart';

class DeleteGoal extends StatelessWidget {
  const DeleteGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(context: context),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    delete_goal,
                  ),
                ),
                Column(
                  children: [
                    GradientText(
                      'Remove Goal',
                      style: const TextStyle(
                          fontSize: 36,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'SpaceGrotesk'),
                      gradient: LinearGradient(colors: [
                        const Color(0xFFCFE1FD).withOpacity(0.9),
                        const Color(0xFFFFFDE1).withOpacity(0.9),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Do you want remove goal of saving \$20,000 to rent a house in 2023',
                        textAlign: TextAlign.center,
                        style: body(color: grey1100),
                      ),
                    ),
                    Text(
                      'You have done 60%',
                      textAlign: TextAlign.center,
                      style: headline(color: corn1),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                AppWidget.typeButtonStartAction(
                    context: context,
                    input: 'Goal accomplished',
                    onPressed: () {},
                    bgColor: blueLight.withOpacity(0.3),
                    borderColor: blueLight.withOpacity(0.3),
                    textColor: grey1100),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: AppWidget.typeButtonStartAction(
                    context: context,
                    input: 'Goals are too hard to achieve',
                    onPressed: () {},
                    bgColor: blueLight.withOpacity(0.3),
                    borderColor: blueLight.withOpacity(0.3),
                  ),
                ),
                AppWidget.typeButtonStartAction(
                  context: context,
                  input: 'Asking for what',
                  onPressed: () {},
                  bgColor: blueLight.withOpacity(0.3),
                  borderColor: blueLight.withOpacity(0.3),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: AppWidget.typeButtonStartAction(
                      context: context,
                      input: 'Continue Goal',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      bgColor: primary,
                      borderColor: primary,
                      textColor: grey1100),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
