import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:first_app/models/nutrition_model.dart';
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class NutritionWidget extends StatefulWidget {
  final NutritionModel nutritionModel;

  const NutritionWidget({
    required this.nutritionModel,
    super.key,
  });

  @override
  State<NutritionWidget> createState() => _NutritionWidgetState();
}

class _NutritionWidgetState extends State<NutritionWidget> {
  final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey();
  late double current;
  late double target;
  late Color color;
  late String title;

  final Size _chartSize = Size(
    SizeConfig.screenWidth / 4.2,
    SizeConfig.screenWidth / 4.2,
  );

  @override
  void initState() {
    super.initState();
    current = widget.nutritionModel.current.toDouble();
    target = widget.nutritionModel.target.toDouble();
    color = widget.nutritionModel.color;
    title = widget.nutritionModel.title;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildChart(), _buildTitle()],
    );
  }

  AnimatedCircularChart _buildChart() {
    return AnimatedCircularChart(
      size: _chartSize,
      key: _chartKey,
      initialChartData: [
        CircularStackEntry(
          [
            CircularSegmentEntry(
              current,
              widget.nutritionModel.color,
              rankKey: 'completed',
            ),
            CircularSegmentEntry(
              target,
              widget.nutritionModel.color.withAlpha(100),
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: false,
      holeLabel: '${current.toInt()}/${target.toInt()}',
      labelStyle: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(16),
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: SizeConfig.getProportionateScreenWidth(18),
        color: Colors.grey[600],
      ),
    );
  }
}
