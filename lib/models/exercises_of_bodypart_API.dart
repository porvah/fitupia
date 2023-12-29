import 'dart:convert';
import 'package:first_app/logic/read_user_cubit/read_user_cubit.dart';
import 'package:first_app/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

List<dynamic> recommendation = [];
Map<String, dynamic> data = {};
List<String> chest = [
  'barbell bench press',
  'archer push up',
  'clap push up',
  'barbell decline bench press',
  'cable standing up straight crossovers'
];
List<String> back = [
  'band straight leg deadlift',
  'band one arm standing low row',
  'cable lat pulldown full range of motion',
  'barbell bent over row',
  'dumbbell lying pullover on exercise ball'
];
List<String> leg = [
  'lever seated squat calf raise on leg press machine',
  'band stiff leg deadlift',
  'walking high knees lunge',
  'barbell floor calf raise',
  'astride jumps (male)'
];
List<String> arm = [
  'barbell curl',
  'band reverse wrist curl',
  'barbell lying preacher curl',
  'bench dip (knees bent)',
  'cable kickback'
];
List<String> abs = [
  'bodyweight incline side plank',
  'assisted motion russian twist',
  'assisted lying leg raise with throw down',
  'assisted lying leg raise with lateral throw down',
  'mountain climber'
];
final List<String> exercises = [
  "Chest Day",
  "Abs Day",
  "Arm Day",
  "Back Day",
  "Leg Day"
];
Future prepareData() async {
  try {
    List<String> parts = [
      'chest',
      'cardio',
      'back',
      'lower%20arms',
      'lower%20legs',
      'neck',
      'shoulders',
      'upper%20arms',
      'upper%20legs',
      'waist'
    ];
    String url = 'https://exercisedb.p.rapidapi.com/exercises/bodyPart/';
    List<String> names = [
      'chest',
      'cardio',
      'back',
      'lower arms',
      'lower legs',
      'neck',
      'shoulders',
      'upper arms',
      'upper legs',
      'abdomen'
    ];
    var headers = {
      "X-RapidAPI-Key": "b881f6ff6cmsha0aa9b600787d60p1dd874jsn0a516986ca32",
      "X-RapidAPI-Host": "exercisedb.p.rapidapi.com"
    };
    Map<String, dynamic> result = {};
    for (int i = 0; i < parts.length; i++) {
      Response response =
          await get(Uri.parse("$url${parts[i]}?limit=100"), headers: headers);
      result[names[i]] = jsonDecode(response.body);
    }

    data = result;
  } catch (e) {
    print("error => $e");
    data = {};
  }
}

void getRecommendation(BuildContext ctx) {
  recommendation = [];
  var today = DateTime.now().weekday;
  UserData? userdata = BlocProvider.of<ReadUserCubit>(ctx).userData;
  List<int> schedule = userdata!.exerciseSchedule;
  int index = schedule.indexOf(today);
  if (index == -1) {
    recommendation = [];
  } else {
    List<String> exerciseList;
    switch (index) {
      case 0:
        exerciseList = chest;
        break;
      case 1:
        exerciseList = abs;
        break;
      case 2:
        exerciseList = arm;
        break;
      case 3:
        exerciseList = back;
        break;
      default:
        exerciseList = leg;
    }
    data.forEach((key, value) {
      for (Map<String, dynamic> exercise in value) {
        if (exerciseList.contains(exercise['name'])) {
          recommendation.add(exercise);
        }
      }
    });
  }
}
