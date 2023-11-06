import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int StartingBMI = 30;
  int CurrentBMI = 25;
  int StartingWight = 90;
  int CurrentWight = 70;
  int CompletedDays = 50;
  int MissedDays = 30;
  List<ChartData> Weights = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(
                text: "Weights",
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )
            ),
            series: <ChartSeries>[
              LineSeries<ChartData, String>(
                enableTooltip: true,
                dataSource: Weights,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              )
            ],

          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "Starting BMI: $StartingBMI",
              style: textStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "Current BMI: $CurrentBMI",
              style: textStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "Starting Wight: $StartingWight",
              style: textStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "Current Wight: $CurrentWight",
              style: textStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "Completed days: $CompletedDays",
              style: textStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text(
              "Missed days: $MissedDays",
              style: textStyle(),
            ),
          ),
        ],
      ),
    );
  }
}


TextStyle textStyle(){
  return TextStyle(
      fontSize: 25
  );
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
