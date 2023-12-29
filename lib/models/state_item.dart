import 'package:hive/hive.dart';

part 'state_item.g.dart';

@HiveType(typeId: 2)
class StateItem extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  double value;

  StateItem({required this.title, required this.value});
}
