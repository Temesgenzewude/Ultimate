import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';

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
            hasLeading: true, hasPop: true, context: context),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'title',
                    child: Text(
                      "Are You There, God? It's Me, Margaret",
                      style: title3(color: grey1100),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox())
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Hero(
              tag: 'subTitle',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Check Out the Digital Art That Is Leaving',
                    style: body(color: grey900),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Immersive and original artwork created for crypto, future-tech and blockchain investors.',
                    style: body(color: grey900),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'All images are available in limited edition prints for the highest quality possible. Printed wall art is the ideal gift for any crypto or art lover.',
                    style: body(color: grey900),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
