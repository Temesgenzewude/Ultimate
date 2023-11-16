import 'package:flutter/material.dart';
import '../../../app/widget_support.dart';

class SecondPageRoute extends PageRouteBuilder<dynamic> {
  SecondPageRoute()
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                const Scaffold());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0.0, 0.0))
              .animate(controller!),
      child: Scaffold(
        appBar: AppWidget.createSimpleAppBar(
            hasLeading: true,
            hasPop: true,
            context: context,
            title: 'All Information'),
      ),
    );
  }
}
