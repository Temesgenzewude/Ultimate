import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/widget/animation_click.dart';
import '../../chart_saving/widget/custom_paint.dart';
import 'main_saving.dart';

class MainSavingHome extends StatefulWidget {
  const MainSavingHome({super.key});

  @override
  State<MainSavingHome> createState() => _MainSavingHomeState();
}

class _MainSavingHomeState extends State<MainSavingHome> {
  List<Widget> listWidget = [];
  int selected = 0;
  List<String> tabs = [houseSimple, chartLine, chartLine];

  @override
  void initState() {
    listWidget = [
      const MainSaving(),
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
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: grey100, width: 2),
                            borderRadius: BorderRadius.circular(99)),
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: primary,
                          child: const Icon(
                            Icons.add,
                            size: 28,
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
                            (index) => index == 1
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
                                                    ? corn1
                                                    : grey600,
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
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
