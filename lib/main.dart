import 'package:fitupia/presentation/screens/home_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Fitupia',
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      // home: HomeScreen(),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
