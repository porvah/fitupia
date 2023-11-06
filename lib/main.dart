import 'package:first_app/presentation/size_config/size_config.dart';
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
    SizeConfig.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitupia',
      theme: Styles.lightTheme,
      darkTheme: Styles.darkTheme,
      // home: SignUp1Screen(),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
