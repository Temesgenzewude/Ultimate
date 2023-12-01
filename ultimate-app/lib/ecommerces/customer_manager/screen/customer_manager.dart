import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';

import '../../../common/widget/animation_click.dart';

import '../widget/upload_image.dart';



class CustomerManager extends StatefulWidget {
  const CustomerManager({Key? key}) : super(key: key);

  @override
  State<CustomerManager> createState() => _CustomerManagerState();
}

class _CustomerManagerState extends State<CustomerManager> {
  
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: false,
          hasPop: true,
          title: 'Upload Images'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
              child: AnimationClick(
                  child: SizedBox(
                      width: width / 3, child: UploadImage().dotted()))),
        ],
      ),
    );
  }
}
