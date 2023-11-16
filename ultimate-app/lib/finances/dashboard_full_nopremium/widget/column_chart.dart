import 'package:flutter/material.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart(
      {required this.height, required this.title, required this.selected});
  final double height;
  final String title;
  final bool selected;
  @override
  _ColumnChartState createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  double height = 0;

  @override
  void initState() {
    Future<dynamic>.delayed(const Duration(seconds: 0)).whenComplete(() {
      if (mounted) {
        setState(() {
          height = widget.height;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: height,
                width: 48,
                curve: Curves.linearToEaseOut,
                decoration: BoxDecoration(
                    color: widget.selected ? corn1 : grey300,
                    borderRadius: BorderRadius.circular(8)),
              ),
              if (widget.selected) ...[
                Positioned(
                  bottom: 4,
                  child: Text(
                    widget.title,
                    style: caption1(color: grey100),
                  ),
                )
              ]
            ],
          ),
        ),
      ],
    );
  }
}
