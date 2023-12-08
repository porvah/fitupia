import 'dart:math';

import 'package:first_app/models/user_data.dart';
import 'package:intl/intl.dart';

class Formulas {
  static int getAge(UserData user) {
    String dateString = user.dateOfBirth;
    DateTime date = DateFormat.yMd().parse(dateString);
    DateTime now = DateTime.now();
    int age = now.year - date.year;
    if (now.month < date.month ||
        (now.month == date.month && now.day < date.day)) {
      age--;
    }
    return age;
  }

  static int getBMR(UserData user) {
    int age = getAge(user);
    double BMR = 10 * user!.weight + 6.25 * user!.height - 5 * age;
    if (user.gender == "Male")
      BMR += 5;
    else
      BMR -= 161;
    return BMR.round();
  }

  static Map<String, int> getDRI(UserData user) {
    Map<String, int> DRI = {
      'Protein': 0,
      'Fats': 0,
      'Carbs': 0,
      'Water': 0,
      'Fiber': 0
    };
    int BMR = getBMR(user);
    int age = getAge(user);

    DRI['Protein'] = (age < 4 ? BMR * .15 / 4 : BMR * .2 / 4).round(); // Grams
    if (age < 4)
      DRI['Fats'] = (BMR * .35 / 9).round();
    else if (age < 19)
      DRI['Fats'] = (BMR * .3 / 9).round();
    else
      DRI['Fats'] = (BMR * .275 / 9).round(); // Grams
    DRI['Carbs'] = (BMR * .55 / 4).round(); // Grams
    DRI['Water'] = (BMR / 250).round(); // cups
    DRI['Fiber'] = (BMR / 1000 * 14).round(); // grams
    return DRI;
  }

  static double getBMI(UserData user) {
    return user.weight / pow(user.height / 100, 2);
  }
}
