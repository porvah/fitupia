import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class CaloriesIndicator extends StatelessWidget {
  final int took;
  final int left;
  final int total;

  const CaloriesIndicator({
    required this.took,
    required this.left,
    required this.total,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPanner('Cal Took', took, Icons.local_fire_department_sharp),
        _buildAllCal(),
        _buildPanner('Cal Left', left, Icons.food_bank_outlined),
      ],
    );
  }

  Widget _buildAllCal() {
    return AnimatedCircularChart(
      size: Size(
        SizeConfig.screenWidth / 3,
        SizeConfig.screenWidth / 3,
      ),
      duration: const Duration(milliseconds: 300),
      key: Key(took.toString()),
      initialChartData: [
        CircularStackEntry(
          [
            CircularSegmentEntry(
              (total - left).toDouble(),
              Colors.red[700],
              rankKey: 'completed',
            ),
            CircularSegmentEntry(
              left.toDouble(),
              Colors.red[700]!.withAlpha(100),
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: false,
      holeLabel: '$total cal',
      labelStyle: TextStyle(
        color: Colors.red[700],
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(20),
      ),
    );
  }

  Widget _buildPanner(String title, int value, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.red[700],
            ),
            Text(
              value.toString(),
              style: TextStyle(
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.getProportionateScreenWidth(22),
              ),
            ),
          ],
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.getProportionateScreenWidth(18),
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
