import 'package:fitupia/workout/workout_screens/workout_screen.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';
import 'presentation/themes/custom_theme.dart';

void main() {
  runApp(const FitupiaApp());
}

class FitupiaApp extends StatelessWidget {
  final AppRouter appRouter = const AppRouter();

  const FitupiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitupia',
      debugShowCheckedModeBanner: false,
      // theme: Styles.lightTheme,
      // darkTheme: Styles.darkTheme,
      home: const WorkoutScreen(),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
