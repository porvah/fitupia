import 'package:fitupia/workout/workout_classes/card_content.dart';
import 'package:flutter/material.dart';
import 'package:fitupia/workout/workout_widgets/card_button_widget.dart';

class GenderScreen extends StatelessWidget {
  static const String routeName = "/gender_screen";
  GenderScreen({super.key});

List<CardContent> gender = [
  CardContent(name: "Male", imgPath: "assets/exercises_cover/male/male.png"),
  CardContent(name: "Female", imgPath: "assets/exercises_cover/female/female.png"),
]; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFC0D1EF),
          body: ListView(
            children: gender.map((g) => CardButtonWidget(card: g, route: '/workout_screen', gender: g.name.toLowerCase(),)).toList(),
          )
          ),
    );
  }
}