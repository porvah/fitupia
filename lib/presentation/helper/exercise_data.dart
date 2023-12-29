// import 'dart:convert';

// import 'package:first_app/logic/read_user_cubit/read_user_cubit.dart';
// import 'package:first_app/models/user_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// List<String> chest = [
//   'barbell bench press',
//   'archer push up',
//   'clap push up',
//   'barbell decline bench press',
//   'cable standing up straight crossovers'
// ];
// List<String> back = [
//   'band straight leg deadlift',
//   'band one arm standing low row',
//   'cable lat pulldown full range of motion',
//   'barbell bent over row',
//   'dumbbell lying pullover on exercise ball'
// ];
// List<String> leg = [
//   'lever seated squat calf raise on leg press machine',
//   'band stiff leg deadlift',
//   'walking high knees lunge',
//   'lever seated squat calf raise on leg press machine',
//   'astride jumps (male)'
// ];
// List<String> arm = [
//   'barbell curl',
//   'band reverse wrist curl',
//   'barbell lying preacher curl',
//   'bench dip (knees bent)',
//   'cable kickback'
// ];
// List<String> abs = [
//   'bodyweight incline side plank',
//   'assisted motion russian twist',
//   'assisted lying leg raise with throw down',
//   'assisted lying leg raise with lateral throw down',
//   'mountain climber'
// ];
// final List<String> exercises = [
//   "Chest Day",
//   "Abs Day",
//   "Arm Day",
//   "Back Day",
//   "Leg Day"
// ];
// Map<String, dynamic> exerciseData = {};
// List<dynamic> recommendation = [];
// Future<void> prepareExerciseData() async {
//   recommendation = [];
//   String input =
//       await rootBundle.loadString('assets/exercises_data/partExercises.json');
//   Map<String, dynamic> map = jsonDecode(input);
//   exerciseData = map;
// }
