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
                duration: const Duration(milliseconds: 100),
                height: height,
                width: 48,
                curve: Curves.linear,
                decoration: BoxDecoration(
                    gradient: widget.selected
                        ? LinearGradient(
                            colors: [
                              const Color(0xFFCFE1FD).withOpacity(0.9),
                              const Color(0xFFFFFDE1).withOpacity(0.9),
                            ],
                          )
                        : null,
                    color: widget.selected ? null : grey1000.withOpacity(0.2),
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
