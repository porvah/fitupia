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

  static Map<String, int> getDRI(UserData user) {
    Map<String, int> dri = {
      'Protein': 0,
      'Fats': 0,
      'Carbs': 0,
      'Water': 0,
      'Fiber': 0
    };
    int bmr = getBMR(user);
    int age = getAge(user);

    dri['Protein'] = (age < 4 ? bmr * .15 / 4 : bmr * .2 / 4).round(); // Grams
    if (age < 4) {
      dri['Fats'] = (bmr * .35 / 9).round();
    } else if (age < 19) {
      dri['Fats'] = (bmr * .3 / 9).round();
    } else {
      dri['Fats'] = (bmr * .275 / 9).round(); // Grams
    }
    dri['Carbs'] = (bmr * .55 / 4).round(); // Grams
    dri['Water'] = (bmr / 250).round(); // cups
    dri['Fiber'] = (bmr / 1000 * 14).round(); // grams
    return dri;
  }

  static double getBMI(UserData user) {
    return user.weight / pow(user.height / 100, 2);
  }
}
