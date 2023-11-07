import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String gender;
  @HiveField(2)
  final String dateOfBirth;
  @HiveField(3)
  final double height;
  @HiveField(4)
  final double weight;
  @HiveField(5)
  final String goal;

  UserData({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.goal,
  });

  UserData copyWith({
    String? name,
    String? gender,
    String? dateOfBirth,
    double? height,
    double? weight,
    String? goal,
  }) {
    return UserData(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      goal: goal ?? this.goal,
    );
  }
}
