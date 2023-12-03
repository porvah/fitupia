import 'package:hive/hive.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 1)
class MealModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double cals;
  @HiveField(2)
  final double weight;
  @HiveField(3)
  final double protein;
  @HiveField(4)
  final double carbs;
  @HiveField(5)
  final double fat;

  MealModel({
    required this.name,
    required this.cals,
    required this.weight,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}
