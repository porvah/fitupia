import 'package:first_app/models/nutrition_model.dart';
import 'package:first_app/presentation/screens/daily_intakes_screen.dart';
import 'package:first_app/presentation/widgets/all_nutritions.dart';
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
  // late List<GPDData> _chartData;
  // late sf.TooltipBehavior _tooltipBehavior;
  final List<NutritionModel> nutritions = const [
    NutritionModel(
      title: 'Fat',
      current: 42,
      target: 50,
      color: Colors.amber,
    ),
    NutritionModel(
      title: 'Proteins',
      current: 70,
      target: 200,
      color: Color.fromRGBO(211, 47, 47, 1),
    ),
    NutritionModel(
      title: 'Carbs',
      current: 92,
      target: 150,
      color: Colors.purple,
    ),
    NutritionModel(
      title: 'Fibers',
      current: 9,
      target: 40,
      color: Color.fromRGBO(21, 101, 192, 1),
    ),
  ];

  @override
  void initState() {
    // _chartData = chartdata;
    // _tooltipBehavior = sf.TooltipBehavior(enable: true);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: AllNutritions(nutritions: nutritions)),
          // const PieChart(
          //   dataMap: {
          //     'Carbohydrates': 1500,
          //     'Total fiber': 2490,
          //     'Protein': 2900,
          //     'Fat': 2305,
          //     'Water': 2088
          //   },
          //   chartType: ChartType.ring,
          //   legendOptions: LegendOptions(legendPosition: LegendPosition.right),
          //   chartRadius: 100,
          // ),
          // sf.SfCircularChart(
          //   legend: const sf.Legend(
          //       isVisible: true,
          //       overflowMode: sf.LegendItemOverflowMode.wrap,
          //       position: sf.LegendPosition.bottom),
          //   tooltipBehavior: _tooltipBehavior,
          //   series: <sf.CircularSeries>[
          //     sf.RadialBarSeries<GPDData, String>(
          //         xValueMapper: (GPDData data, _) => data.continent,
          //         yValueMapper: (GPDData data, _) => data.gpd,
          //         dataSource: _chartData,
          //         dataLabelSettings:
          //             const sf.DataLabelSettings(isVisible: true),
          //         radius: "70%",
          //         maximumValue: 3000)
          //   ],
          // ),
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
          CustomButton(
            title: 'Daily Intakes',
            onPressed: () {
              Navigator.of(context).pushNamed(DailyIntakesScreen.routeName);
            },
            icon: Icons.dinner_dining,
            color: Colors.white,
            backgroundColor: const Color.fromRGBO(234, 141, 11, 1),
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
