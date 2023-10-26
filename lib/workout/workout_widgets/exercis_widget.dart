import 'package:fitupia/workout/workout_classes/card_content.dart';
import 'package:flutter/material.dart';

class ExercisWidget extends StatelessWidget {
  final CardContent exercis;
  const ExercisWidget({super.key, required this.exercis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                pinned: true,
                floating: false,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFFBED8ED),
                    Color(0xFFc5dcef),
                    Color(0xFFcbe0f1),
                  ])),
                  child: FlexibleSpaceBar(
                    expandedTitleScale: 1.0,
                    title: Text(
                      "${exercis.name} Exercises",
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: "CaesarDressing",
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    centerTitle: true,
                    background: Image.asset(
                      exercis.imgPath,
                      fit: BoxFit.cover,
                      color: const Color(0xaa212121),
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                ),
              )
            ];
          },
          body: const Center(child: Text(""))),
    );
  }
}
