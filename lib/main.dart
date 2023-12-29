import 'package:first_app/presentation/helper/exercise_data.dart';
import 'package:first_app/presentation/screens/exercis_screen.dart';
import 'package:first_app/presentation/screens/workout_screen.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';
import 'presentation/themes/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await prepareExerciseData();

  runApp(const FitupiaApp());
}

class FitupiaApp extends StatelessWidget {
  final AppRouter appRouter = const AppRouter();

  const FitupiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitupia',
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      home: WorkoutScreen(),
      onGenerateRoute: appRouter.generateRoute,
      // initialRoute: '/',
    );
  }
}
