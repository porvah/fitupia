import 'package:first_app/logic/formulas.dart';
import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  static const String routeName = '/stats_screen';

  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String startingBMI = '0';
  String currentBMI = '0';
  String startingWeight = '0';
  String currentWeight = '0';
  int completedDays = 50;
  int missedDays = 30;
  List<ChartData> weights = [
    ChartData('Apr', 32),
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('May', 40),
    ChartData('Mar', 34),
    ChartData('Jun', 80),
    ChartData('a', 10),
  ];

  @override
  void initState() {
    super.initState();
    var user = BlocProvider.of<RegistrationCubit>(context).curUser;
    startingWeight = user.weight.toString();
    currentWeight = user.weight.toString();
    startingBMI = Formulas.getBMI(user).toStringAsFixed(1);
    currentBMI = startingBMI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Statistics',
        Colors.white,
        const Color.fromARGB(255, 6, 85, 149),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChart(),
            _buildPanner('BMI', startingBMI.toString(), currentBMI.toString()),
            _buildPanner(
                'Weight', startingWeight.toString(), currentWeight.toString()),
            // _getText('Completed days: $completedDays'),
            // _getText('Missed days: $missedDays'),
          ],
        ),
      ),
    );
  }

  SfCartesianChart _buildChart() {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(
          text: "Weights",
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      series: <ChartSeries>[
        LineSeries<ChartData, String>(
          enableTooltip: true,
          dataSource: weights,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        )
      ],
    );
  }

  Widget _buildPanner(String title, String startingValue, String currValue) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 46, 133, 204),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildPannerTitle(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildPannerValue('Starting: $startingValue'),
              _buildPannerValue('Current: $currValue'),
            ],
          )
        ],
      ),
    );
  }

  Text _buildPannerValue(String startingValue) {
    return Text(
      startingValue,
      style: const TextStyle(
        color: Color.fromARGB(255, 252, 234, 234),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildPannerTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color.fromARGB(255, 236, 236, 236),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
