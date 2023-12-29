import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sf;

import '../../models/gpd_model.dart';
import '../helper/nutrition.dart';
import 'notebook_screen.dart';
import '../themes/appbar.dart';
import '../widgets/custom_button.dart';

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
    _chartData = chartdata;
    _tooltipBehavior = sf.TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Diet',
        Colors.white70,
        const Color.fromRGBO(234, 141, 11, 1),
      ),
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
                'Protein': 2900,
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
                    yValueMapper: (GPDData data, _) => data.gpd,
                    dataSource: _chartData,
                    dataLabelSettings:
                        const sf.DataLabelSettings(isVisible: true),
                    radius: "70%",
                    maximumValue: 3000)
              ],
            ),
            CustomButton(
              title: 'Add Meal',
              onPressed: () {
                Navigator.of(context).pushNamed(NoteBookScreen.routeName);
              },
              icon: Icons.add,
              color: Colors.white,
              backgroundColor: Colors.redAccent,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
