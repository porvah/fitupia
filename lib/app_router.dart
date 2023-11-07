import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:first_app/presentation/screens/registration_screen.dart';
import 'package:first_app/presentation/screens/signup1_screen.dart';
import 'package:first_app/presentation/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/calendar_screen.dart';
import 'presentation/screens/diet_screen.dart';
import 'presentation/screens/dummy_screen.dart';
import 'presentation/screens/food_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/notebook_screen.dart';
import 'presentation/screens/signup2_screen.dart';
import 'presentation/screens/signup3_screen.dart';
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

      case FoodScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FoodScreen());
      case NoteBookScreen.routeName:
        return MaterialPageRoute(builder: (_) => const NoteBookScreen());
      case DietScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DietScreen());

      case CalendarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case StatsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const StatsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DummyScreen());
    }
  }
}
