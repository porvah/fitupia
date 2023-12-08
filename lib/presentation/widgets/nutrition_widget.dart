import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:first_app/models/nutrition_model.dart';
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class NutritionWidget extends StatelessWidget {
  final NutritionModel nutritionModel;

  const NutritionWidget({
    required this.nutritionModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildChart(),
        _buildTitle(),
      ],
    );
  }

  AnimatedCircularChart _buildChart() {
    print(nutritionModel.current);
    print(nutritionModel.target);
    return AnimatedCircularChart(
      size: Size(
        SizeConfig.screenWidth / 4.2,
        SizeConfig.screenWidth / 4.2,
      ),
      duration: const Duration(milliseconds: 300),
      key: Key(nutritionModel.current.toString()),
      initialChartData: [
        CircularStackEntry(
          [
            CircularSegmentEntry(
              nutritionModel.current.toDouble(),
              nutritionModel.color,
              rankKey: 'completed',
            ),
            CircularSegmentEntry(
              (nutritionModel.target - nutritionModel.current).toDouble(),
              nutritionModel.color.withAlpha(100),
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: false,
      holeLabel: '${nutritionModel.current}/${nutritionModel.target}',
      labelStyle: TextStyle(
        color: nutritionModel.color,
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(16),
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      nutritionModel.title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(18),
        color: Colors.grey[600],
      ),
    );
  }
}
