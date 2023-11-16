import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_ChartData> data = [
      _ChartData('Other', 8, green),
      _ChartData('🔥 Lovely', 28, grey1000),
      _ChartData('🔥 Hot', 18, primary),
      _ChartData('🎉 Party', 21, corn1),
      _ChartData('💖 Crush', 25, stPatricksBlue)
    ];
    return SfCircularChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        margin: const EdgeInsets.all(0),
        series: <CircularSeries>[
          DoughnutSeries<_ChartData, String>(
              dataSource: data,
              radius: '60%',
              animationDuration: 1000,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              pointColorMapper: (datum, index) => datum.color,
              explode: true,
              enableTooltip: true,
              sortingOrder: SortingOrder.ascending,
              explodeAll: true,
              dataLabelSettings: DataLabelSettings(
                  builder: (dynamic data, dynamic point, dynamic series,
                      pointIndex, seriesIndex) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${data.y}%', style: title4(color: data.color)),
                        Text(data.x, style: subhead(color: grey1100)),
                      ],
                    );
                  },
                  labelIntersectAction: LabelIntersectAction.shift,
                  connectorLineSettings: const ConnectorLineSettings(
                    length: '10',
                    type: ConnectorType.curve,
                    width: 2,
                  ),
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.outside),
              cornerStyle: CornerStyle.bothCurve)
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final int y;
  final Color color;
}
