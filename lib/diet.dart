//import 'package:first_app/Meal.dart';
//import 'package:first_app/homeDiet.dart';
import 'package:first_app/notebook.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sf;
// import 'package:syncfusion_flutter_charts/charts.dart';

class Diet extends StatefulWidget {
  const Diet({super.key});
  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  late List<GPDData> _chartData;
  late sf.TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = sf.TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white
          // gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     colors: [Colors.white, Color.fromARGB(255, 76, 175, 80)]),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          const PieChart(
            dataMap: {
              'Carbohydrates': 1500,
              'Total fiber': 2490,
              'Protien': 2900,
              'Fat': 2305,
              'Water': 2088
            },
            chartType: ChartType.ring,
            legendOptions: LegendOptions(legendPosition: LegendPosition.right),
            chartRadius: 100,
          ),
          sf.SfCircularChart(
            legend: sf.Legend(
                isVisible: true,
                overflowMode: sf.LegendItemOverflowMode.wrap,
                position: sf.LegendPosition.bottom),
            tooltipBehavior: _tooltipBehavior,
            series: <sf.CircularSeries>[
              // sf.PieSeries<GPDData, String>(
              //   dataSource: _chartData,
              //   xValueMapper: (GPDData data, _) => data.continent,
              //   yValueMapper: (GPDData data, _) => data.gdp,
              //   radius: '70%',
              //   dataLabelSettings: const sf.DataLabelSettings(isVisible: true),
              //   enableTooltip: true,
              // ),
              sf.RadialBarSeries<GPDData, String>(
                  xValueMapper: (GPDData data, _) => data.continent,
                  yValueMapper: (GPDData data, _) => data.gdp,
                  dataSource: _chartData,
                  dataLabelSettings:
                      const sf.DataLabelSettings(isVisible: true),
                  radius: "70%",
                  maximumValue: 3000)
            ],
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => const NoteBook()));
            },
            label: const Text('Add Meal'),
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }

  List<GPDData> getChartData() {
    List<GPDData> chartdata = [
      GPDData('Carbohydrates', 1500),
      GPDData('Total fiber', 2490),
      GPDData('Protien', 2900),
      GPDData('Fat', 2305),
      GPDData('Water', 10),
    ];
    return chartdata;
  }
}

class GPDData {
  GPDData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
