import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class ExercisesOfBodyPartAPI {
  String bodyPart;
  ExercisesOfBodyPartAPI({required this.bodyPart});

  Future<List<dynamic>> getData() async {
    List<dynamic> data = [];
    try {
      // Response response = await get(
      //   Uri.parse('https://exercisedb.p.rapidapi.com/exercises/bodyPart/$bodyPart'),
      //   headers: {
      //     'X-RapidAPI-Key': 'c123c06545mshc095c405761be37p141cc9jsn4cc33e1eecc4',
      //     'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
      //   }
      // );
      var input = await rootBundle
          .loadString('assets/exercises_data/partExercises.json');
      var map = jsonDecode(input);
      var data = map[bodyPart];
      print(data);
    } catch (e) {
      print("error => $e");
    }
    return data;
  }
}
