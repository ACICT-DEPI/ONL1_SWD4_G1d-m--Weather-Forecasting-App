import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/searchControlar.dart';
import '../model/five_days_data.dart';

class SearchChart extends GetView<CitySearchController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries<FiveDayData, String>>[
            SplineSeries<FiveDayData, String>(
              dataSource: controller.fiveDaysData,
              xValueMapper: (FiveDayData f, _) =>
              f.dateTime,
              yValueMapper: (FiveDayData f, _) =>
              f.temp,
            ),
          ],
        ),
      ),
    );
  }
}
