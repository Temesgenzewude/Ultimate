import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/widget/animation_click.dart';
import 'column_chart.dart';

class Chart extends StatefulWidget {
  const Chart(
      {super.key,
      required this.countColumn,
      required this.label,
      required this.selecteds});
  final int countColumn;
  final List<String> label;
  final List<bool> selecteds;
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<bool> selecteds = [];

  @override
  Widget build(BuildContext context) {
    selecteds = widget.selecteds;
    return Container(
      height: 160,
      decoration: const BoxDecoration(color: grey200),
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: widget.countColumn,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 6,
                  );
                },
                itemBuilder: (context, index) {
                  return AnimationClick(
                    function: () {
                      setState(() {
                        for (int i = 0; i < selecteds.length; i++) {
                          selecteds[i] = false;
                        }
                        selecteds[index] = true;
                      });
                    },
                    child: ColumnChart(
                      selected: selecteds[index],
                      height: Random().nextDouble() * 160,
                      title: widget.label[index],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
