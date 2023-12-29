import 'package:first_app/presentation/screens/daily_intakes_screen.dart';
import 'package:first_app/presentation/screens/encyclopedia_screen.dart';
import 'package:first_app/presentation/screens/meals_screen.dart';
import 'package:first_app/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/calendar_screen.dart';
import 'presentation/screens/custom_meal_screen.dart';
import 'presentation/screens/diet_screen.dart';
import 'presentation/screens/dummy_screen.dart';
import 'presentation/screens/food_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/notebook_screen.dart';
import 'presentation/screens/registration_screen.dart';
import 'presentation/screens/settings_screen.dart';
import 'presentation/screens/stats_screen.dart';
import 'presentation/screens/signup1_screen.dart';
import 'presentation/screens/signup2_screen.dart';
import 'presentation/screens/signup3_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/welcome_screen.dart';
import 'presentation/screens/workout_screen.dart';
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

      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case SettingsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      case SignUp1Screen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUp1Screen());
      case SignUp2Screen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUp2Screen());
      case SignUp3Screen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUp3Screen());

      case DummyScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DummyScreen());
      case WorkoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WorkoutScreen());
      case EncyclopediaScreen.routeName:
        return MaterialPageRoute(builder: (_) => const EncyclopediaScreen());

      case MealsScreen.routeName:
        int toBeDisplayedList = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => MealsScreen(toBeDisplayedList));
      case FoodScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FoodScreen());
      case NoteBookScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NoteBookScreen());
      case DietScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DietScreen());
      case DailyIntakesScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DailyIntakesScreen());
      case CustomMealScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CustomMealScreen());

      case CalendarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case StatsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const StatsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DummyScreen());
    }
  }
}
