import 'package:fitupia/workout/exercises_screens/arms_screen.dart';
import 'package:fitupia/workout/exercises_screens/chest_screen.dart';
import 'package:fitupia/workout/exercises_screens/back_screen.dart';
import 'package:fitupia/workout/exercises_screens/legs_screen.dart';
import 'package:fitupia/workout/exercises_screens/shoulders_screen.dart';
import 'package:fitupia/workout/workout_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/welcome_screen.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case workout_screen.routeName:
        return MaterialPageRoute(builder: (_) => workout_screen());
      case chest_screen.routeName:
        return MaterialPageRoute(builder: (_) => const chest_screen());
      case back_screen.routeName:
        return MaterialPageRoute(builder: (_) => const back_screen());
      case legs_screen.routeName:
        return MaterialPageRoute(builder: (_) => const legs_screen());
      case shoulders_screen.routeName:
        return MaterialPageRoute(builder: (_) => const shoulders_screen());
      case arms_screen.routeName:
        return MaterialPageRoute(builder: (_) => const arms_screen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
