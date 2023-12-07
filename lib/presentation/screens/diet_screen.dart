import 'package:first_app/logic/formulas.dart';
import 'package:first_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sf;

import '../../models/gpd_model.dart';
import '../helper/helper.dart';
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
  late Map<String, double> DRI;

  @override
  void getDRI()async{
    Box userBox = await Hive.openBox<UserData>(kUserBox);
    setState(() {
      DRI = Formulas.getDRI(userBox.getAt(0));
    });
  }
  @override
  void initState() {
    _chartData = chartdata;
    _tooltipBehavior = sf.TooltipBehavior(enable: true);
    getDRI();
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
            PieChart(
              dataMap: DRI,
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

/*
*
  }*/