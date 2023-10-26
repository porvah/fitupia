import 'package:fitupia/workout/workout_screens/exercises_screens/abdomen_screen.dart';
import 'package:fitupia/workout/workout_screens/exercises_screens/arms_screen.dart';
import 'package:fitupia/workout/workout_screens/exercises_screens/back_screen.dart';
import 'package:fitupia/workout/workout_screens/exercises_screens/cardio_screen.dart';
import 'package:fitupia/workout/workout_screens/exercises_screens/chest_screen.dart';
import 'package:fitupia/workout/workout_screens/exercises_screens/legs_screen.dart';
import 'package:fitupia/workout/workout_screens/exercises_screens/shoulders_screen.dart';

import 'package:fitupia/workout/workout_screens/workout_screen.dart';
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
      case WorkoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WorkoutScreen());
      case ChestScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  ChestScreen(args),);
      case BackScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  BackScreen(args));
      case LegsScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  LegsScreen(args));
      case ShouldersScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  ShouldersScreen(args));
      case ArmsScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  ArmsScreen(args));
      case AbdomenScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  AbdomenScreen(args));
      case CardioScreen.routeName:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (_) =>  CardioScreen(args));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
