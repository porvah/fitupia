import 'package:fitupia/workout/workout_classes/card_content.dart';
List<CardContent> ListOfExercises(String gender){
  List<CardContent> exercises = [
    CardContent(name: "Abdomen", imgPath: "assets/exercises_cover/$gender/abdomen.png"),
    CardContent(name: "Chest", imgPath: "assets/exercises_cover/$gender/chest.png"),
    CardContent(name: "Arms", imgPath: "assets/exercises_cover/$gender/arm.png"),
    CardContent(name: "Legs", imgPath: "assets/exercises_cover/$gender/leg.png"),
    CardContent(name: "Back", imgPath: "assets/exercises_cover/$gender/back.png"),
    CardContent(name: "shoulders", imgPath: "assets/exercises_cover/$gender/shoulders.png"),
    CardContent(name: "Cardio", imgPath: "assets/exercises_cover/$gender/cardio.png"),
  ];
  return exercises;
}