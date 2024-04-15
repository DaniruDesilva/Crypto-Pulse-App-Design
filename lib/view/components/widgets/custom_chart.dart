import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/chart_model.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({
    super.key,
    required this.myHeight,
    required this.myWidth,
    required this.isRefresh,
    required this.itemChart,
    required this.trackballBehavior,
  });

  final double myHeight;
  final double myWidth;
  final bool isRefresh;
  final List<ChartModel>? itemChart;
  final TrackballBehavior trackballBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: myHeight * 0.4,
      width: myWidth,
      // color: Colors.amber,
      child: isRefresh == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFBC700),
              ),
            )
          : itemChart == null
              ? Padding(
                  padding: EdgeInsets.all(myHeight * 0.06),
                  child: const Center(
                    child: Text(
                      'Attention this Api is-free, so you cannot send multiple requests per second, please wait and try again later. ',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                )
              : SfCartesianChart(
                  trackballBehavior: trackballBehavior,
                  zoomPanBehavior: ZoomPanBehavior(
                      enablePinching: true, zoomMode: ZoomMode.x),
                  series: <CandleSeries>[
                    CandleSeries<ChartModel, int>(
                      enableSolidCandles: true,
                      enableTooltip: true,
                      bullColor: Colors.green,
                      bearColor: Colors.red,
                      dataSource: itemChart,
                      xValueMapper: (ChartModel sales, _) => sales.time,
                      lowValueMapper: (ChartModel sales, _) => sales.low,
                      highValueMapper: (ChartModel sales, _) => sales.high,
                      openValueMapper: (ChartModel sales, _) => sales.open,
                      closeValueMapper: (ChartModel sales, _) => sales.close,
                      animationDuration: 55,
                    )
                  ],
                ),
    );
  }
}
