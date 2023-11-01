import 'package:fitupia/presentation/screens/calendar_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/splash_screen.dart';

class AppRouter {
  const AppRouter();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case CalendarScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
