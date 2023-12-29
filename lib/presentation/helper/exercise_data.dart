import 'dart:convert';

import 'package:flutter/services.dart';

Map<String, dynamic> exerciseData = {};

Future<void> prepareExerciseData() async {
  String input =
      await rootBundle.loadString('assets/exercises_data/partExercises.json');
  var map = jsonDecode(input);
  exerciseData = map;
}
