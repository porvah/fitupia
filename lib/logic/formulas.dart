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
    double bmr = 10 * user.weight + 6.25 * user.height - 5 * age;
    if (user.gender == "Male") {
      bmr += 5;
    } else {
      bmr -= 161;
    }
    return bmr.round();
  }

  static int getAllCalories(UserData user) {
    int bmr = getBMR(user);

    if (user.goal == 'Gain Muscles') {
      return (bmr * 1.7).round();
    } else {
      return (bmr * 1.2).round();
    }
  }

  static Map<String, int> getDRI(UserData user) {
    Map<String, int> dri = {
      'Protein': 0,
      'Fats': 0,
      'Carbs': 0,
      'Water': 0,
      'Fiber': 0
    };
    int allCal = getAllCalories(user);
    int age = getAge(user);

    dri['Protein'] =
        (age < 4 ? allCal * .15 / 4 : allCal * .2 / 4).round(); // Grams
    if (age < 4) {
      dri['Fats'] = (allCal * .35 / 9).round();
    } else if (age < 19) {
      dri['Fats'] = (allCal * .3 / 9).round();
    } else {
      dri['Fats'] = (allCal * .275 / 9).round(); // Grams
    }
    dri['Carbs'] = (allCal * .55 / 4).round(); // Grams
    dri['Water'] = (allCal / 250).round(); // cups
    dri['Fiber'] = (allCal / 1000 * 14).round(); // grams
    return dri;
  }

  static double getBMI(UserData user) {
    return user.weight / pow(user.height / 100, 2);
  }
}
