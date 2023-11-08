import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sf;

import 'notebook_screen.dart';

class DietScreen extends StatefulWidget {
  static const String routeName = '/diet_screen';

  const DietScreen({super.key});
  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
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
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
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
              legendOptions:
                  LegendOptions(legendPosition: LegendPosition.right),
              chartRadius: 100,
            ),
            sf.SfCircularChart(
              legend: const sf.Legend(
                  isVisible: true,
                  overflowMode: sf.LegendItemOverflowMode.wrap,
                  position: sf.LegendPosition.bottom),
              tooltipBehavior: _tooltipBehavior,
              series: <sf.CircularSeries>[
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const NoteBookScreen()));
              },
              label: const Text('Add Meal'),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(234, 141, 11, 1),
      leading: const BackButton(
        color: Colors.white70,
      ),
      title: const Text(
        "Diet",
        style: TextStyle(
          color: Colors.white70,
        ),
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
