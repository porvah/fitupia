import 'package:fitupia/workout/exercises_classes/Exercis.dart';
List ListOfExercises(){
  List<Exercis> exercises = [
    Exercis(name: "Chest", imgPath: "assets/exercises_cover/chest.png"),
    Exercis(name: "Back", imgPath: "assets/exercises_cover/back.png"),
    Exercis(name: "Legs", imgPath: "assets/exercises_cover/leg.png"),
    Exercis(name: "shoulders", imgPath: "assets/exercises_cover/shoulders.png"),
    Exercis(name: "Arms", imgPath: "assets/exercises_cover/arm.png"),
  ];
  return exercises;
}