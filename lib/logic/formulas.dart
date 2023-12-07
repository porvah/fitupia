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
      'Protein':0,
      'Fats':0,
      'Carbs':0,
      'Water':0,
      'Fiber':0
    };
    double BMR = getBMR(user);
    int age = getAge(user);

    DRI['Protein'] = age < 4 ? BMR * .15 / 4 : BMR * .2 / 4; // Grams
    if (age < 4)DRI['Fats'] = BMR * .35 / 9;
    else if (age < 19)DRI['Fats'] = BMR * .3 / 9;
    else DRI['Fats'] = BMR * .275 / 9; // Grams
    DRI['Carbs'] = BMR * .55 / 4; // Grams
    DRI['Water'] = BMR / 250; // cups
    DRI['Fiber'] = BMR / 1000 * 14; // grams
    return DRI;
  }
  static double getBMI(UserData user){
    return user.weight / pow(user.height / 100, 2);
  }

}