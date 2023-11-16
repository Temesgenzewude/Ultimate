import 'package:flutter/material.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/textfield.dart';
import '../widget/upload_image.dart';

List<Map<String, dynamic>> generals = [
  <String, dynamic>{
    'title': 'Categories',
    'icon': archive_box,
  },
  <String, dynamic>{
    'title': 'Type',
    'icon': archive,
  },
  <String, dynamic>{
    'title': 'Price',
    'icon': currency_circle_dollar,
  },
  <String, dynamic>{
    'title': 'Stock',
    'icon': cards,
  },
];

class CustomerManager extends StatefulWidget {
  const CustomerManager({Key? key}) : super(key: key);

  @override
  State<CustomerManager> createState() => _CustomerManagerState();
}

class _CustomerManagerState extends State<CustomerManager> {
  TextEditingController productCtl = TextEditingController();
  FocusNode productFn = FocusNode();
  TextEditingController descriptionCtl = TextEditingController();
  FocusNode descriptionFn = FocusNode();
  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return Scaffold(
      appBar: AppWidget.createSimpleAppBar(
          context: context,
          hasLeading: true,
          hasPop: true,
          title: 'Add New Product'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: AppWidget.typeButtonStartAction2(
                  context: context,
                  input: 'Save',
                  onPressed: () {},
                  bgColor: const Color(0xFF3E517A),
                  borderColor: const Color(0xFF3E517A),
                  textColor: grey1100),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: AppWidget.typeButtonStartAction2(
                  context: context,
                  input: 'Publish',
                  onPressed: () {},
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
              child: AnimationClick(
                  child: SizedBox(
                      width: width / 3, child: UploadImage().dotted()))),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: TextFieldCpn(
              controller: productCtl,
              focusNode: productFn,
              filled: true,
              fillColor: grey200,
              hintText: 'Name Product',
              showSuffixIcon: true,
              suffixWidget: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '0/120',
                  style: subhead(color: grey500),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TextFieldCpn(
              controller: descriptionCtl,
              focusNode: descriptionFn,
              filled: true,
              fillColor: grey200,
              hintText: 'Description',
              showSuffixIcon: true,
              suffixWidget: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '0/120',
                  style: subhead(color: grey500),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'General',
              style: title3(color: grey1100),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: grey200, borderRadius: BorderRadius.circular(16)),
            child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => AnimationClick(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: grey300,
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset(generals[index]['icon'],
                                width: 28, height: 28),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              generals[index]['title'],
                              style: headline(color: grey1100),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 32,
                            color: grey500,
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: generals.length),
          ),
        ],
      ),
    );
  }
}
