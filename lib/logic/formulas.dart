import 'dart:math';

import 'package:first_app/models/user_data.dart';

class Formulas{

  static int getAge(UserData user){
    String dateString = user.dateOfBirth;
    DateTime date = DateTime.parse('${dateString.split('/')[2]}-${dateString.split('/')[0]}-${dateString.split('/')[1]}');
    DateTime now = DateTime.now();
    int age = now.year - date.year;
    if (now.month < date.month ||
        (now.month == date.month && now.day < date.day)) {
      age--;
    }
    return age;
  }
  static double getBMR(UserData user){
    int age = getAge(user);
    double BMR = 10*user!.weight + 6.25*user!.height - 5*age;
    if (user.gender == "Male")BMR += 5;
    else BMR -= 161;
    return BMR;
  }
  static Map<String, double> getDRI(UserData user){
    Map<String, double> DRI = {
      'protein':0,
      'fats':0,
      'carbs':0,
      'water':0,
      'fiber':0
    };
    double BMR = getBMR(user);
    int age = getAge(user);

    DRI['protein'] = age < 4 ? BMR * .15 / 4 : BMR * .2 / 4; // Grams
    if (age < 4)DRI['fats'] = BMR * .35 / 9;
    else if (age < 19)DRI['fats'] = BMR * .3 / 9;
    else DRI['fats'] = BMR * .275 / 9; // Grams
    DRI['carbs'] = BMR * .55 / 4; // Grams
    DRI['water'] = BMR; // ml
    DRI['fiber'] = BMR / 1000 * 14; // grams
    return DRI;
  }
  static double getBMI(UserData user){
    return user.weight / pow(user.height / 100, 2);
  }

}