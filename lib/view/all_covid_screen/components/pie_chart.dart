import 'package:covid_19_tracker_app/instance/getx_controller_instance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

class pie_chart extends StatelessWidget {
  const pie_chart({
    required this.total_cases ,required this.total_recovered , required this.total_death,
    Key? key}) : super(key: key);

  final String total_cases , total_recovered , total_death;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      child: PieChart(
          dataMap: {
            "Total" : double.parse(total_cases),
            "Recovred" : double.parse(total_recovered),
            "Deaths" : double.parse(total_death),
          },
        animationDuration: Duration(seconds: 3),
        chartRadius: 150.sp,
        colorList: [  Color(0xff4285F4),  Color(0xff1aa260),  Color(0xffde5246),],
        chartType: ChartType.ring,
        initialAngleInDegree: 0,
        ringStrokeWidth: 25.sp,
        chartLegendSpacing: 50.w,
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.left,
            showLegends: true,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          decimalPlaces: 0,
        ),
      ),
    );
  }
}
