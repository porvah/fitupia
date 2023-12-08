import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  String dateOfBirth;
  @HiveField(3)
  double height;
  @HiveField(4)
  double weight;
  @HiveField(5)
  String goal;
  @HiveField(6)
  List<int> exerciseSchedule;

  UserData({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    required this.goal,
    required this.exerciseSchedule,
  });

  void copyWith({
    String? name,
    String? gender,
    String? dateOfBirth,
    double? height,
    double? weight,
    String? goal,
    List<int>? exerciseSchedule,
  }) {
    this.name = name ?? this.name;
    this.gender = gender ?? this.gender;
    this.dateOfBirth = dateOfBirth ?? this.dateOfBirth;
    this.height = height ?? this.height;
    this.weight = weight ?? this.weight;
    this.goal = goal ?? this.goal;
    this.exerciseSchedule = exerciseSchedule ?? this.exerciseSchedule;
  }
}
