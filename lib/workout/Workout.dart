import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFC0D1EF),
          body: Container(
            margin: const EdgeInsets.all(10.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {},
                child: Ink.image(
                  image: const AssetImage("assets/back.png"),
                  height: 200.0,
                  fit: BoxFit.fill,
                  child: const Center(
                    child: Text(
                      "Back Exercises",
                      style: TextStyle(
                        fontFamily: "CaesarDressing",
                        fontSize: 38.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ),
              ),
            ),
          )),
    );
  }
}
