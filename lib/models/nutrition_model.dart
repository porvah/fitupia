import 'package:flutter/material.dart';

class NutritionModel {
  final String title;
  final int current;
  final int target;
  final Color color;

  const NutritionModel({
    required this.title,
    required this.current,
    required this.target,
    required this.color,
  });
}
