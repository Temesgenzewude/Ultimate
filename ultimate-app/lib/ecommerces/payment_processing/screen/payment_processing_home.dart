import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import 'payment_processing.dart';

class PaymentProcessingHome extends StatefulWidget {
  const PaymentProcessingHome({super.key});

  @override
  State<PaymentProcessingHome> createState() => _PaymentProcessingHomeState();
}

class _PaymentProcessingHomeState extends State<PaymentProcessingHome> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  @override
  void initState() {
    listWidget = [
      const PaymentProcessing(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Material(
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              AppWidget.createItemNav2(
                  context, chart_pie_slice, chart_pie_slice, 'House Simple',
                  iconColor: primary),
              AppWidget.createItemNav2(
                  context, cardHolder, cardHolder, 'Calendar',
                  iconColor: primary),
              AppWidget.createItemNav2(
                  context, code_sandbox_logo, code_sandbox_logo, 'Timer',
                  iconColor: primary),
              AppWidget.createItemNav2(
                  context, user_circle, user_circle, 'User',
                  iconColor: primary),
            ],
          ),
        ),
      ),
    );
  }
}
