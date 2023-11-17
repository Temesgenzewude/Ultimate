import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/widget/animation_click.dart';
import '../widget/custom_paint.dart';
import 'order_management.dart';

class OrderManagementHome extends StatefulWidget {
  const OrderManagementHome({super.key});

  @override
  State<OrderManagementHome> createState() => _OrderManagementHomeState();
}

class _OrderManagementHomeState extends State<OrderManagementHome> {
  List<Widget> listWidget = [];
  int selected = 0;
  List<String> tabs = [
    chart_pie_slice,
    cardHolder,
    chart_line,
    chart_line,
    avtFemale
  ];

  @override
  void initState() {
    listWidget = [
      const OrderManagement(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
                width: size.width,
                height: size.height,
                child: listWidget.elementAt(selected)),
          ),
          Positioned(
            bottom: 0,
            left: 5,
            right: 5,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  IgnorePointer(
                    child: CustomPaint(
                      size: Size(size.width, 80),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Center(
                      heightFactor: 0.7,
                      child: SizedBox(
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: primary,
                          child: const Icon(
                            Icons.add,
                            size: 32,
                            color: corn1,
                          ),
                          elevation: 0.1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 70,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            tabs.length,
                            (index) => index == 2
                                ? Container(
                                    width: size.width * .20,
                                  )
                                : AnimationClick(
                                    function: () {
                                      setState(() {
                                        selected = index;
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              index == 4 ? 24 : 0),
                                          child: Image.asset(
                                            tabs[index],
                                            color: index == 4
                                                ? null
                                                : index == selected
                                                    ? primary
                                                    : grey600,
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        if (index == selected) ...[
                                          Container(
                                            width: 4,
                                            height: 4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                color: primary),
                                          )
                                        ]
                                      ],
                                    ),
                                  ))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}