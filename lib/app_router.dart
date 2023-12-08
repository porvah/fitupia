import 'package:first_app/presentation/screens/exercis_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/calendar_screen.dart';
import 'presentation/screens/diet_screen.dart';
import 'presentation/screens/dummy_screen.dart';
import 'presentation/screens/food_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/notebook_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/welcome_screen.dart';
import 'presentation/screens/workout_screen.dart';

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
      case DummyScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DummyScreen());
      case WorkoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WorkoutScreen());
      case FoodScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FoodScreen());
      case NoteBookScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NoteBookScreen());
      case DietScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DietScreen());
      case CalendarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      // case ExercisScreen.routeName:
      //   return MaterialPageRoute(builder: (_) => const ExercisScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DummyScreen());
    }
  }
}
