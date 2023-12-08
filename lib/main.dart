import 'package:first_app/logic/add_meal_cubit/add_meal_cubit.dart';
import 'package:first_app/logic/read_meal_cubit/read_meal_cubit.dart';
import 'package:first_app/logic/read_user_cubit/read_user_cubit.dart';
import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/helper/helper.dart';
import 'package:first_app/presentation/helper/meals.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'app_router.dart';
import 'models/user_data.dart';
import 'presentation/themes/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await prepareMeals();

  await Hive.initFlutter();

  Hive.registerAdapter(UserDataAdapter());
  Hive.registerAdapter(MealModelAdapter());

  await Hive.openBox<UserData>(kUserBox);
  await Hive.openBox<MealModel>(kMealBox);

  runApp(const FitupiaApp());
}

class FitupiaApp extends StatelessWidget {
  final AppRouter appRouter = const AppRouter();

  const FitupiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<RegistrationCubit>(create: (_) => RegistrationCubit()),
        BlocProvider<ReadUserCubit>(create: (_) => ReadUserCubit()),
        BlocProvider<AddMealCubit>(create: (_) => AddMealCubit()),
        BlocProvider<ReadMealCubit>(create: (_) => ReadMealCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fitupia',
        theme: Styles.lightTheme,
        // home: ,
        onGenerateRoute: appRouter.generateRoute,
        // initialRoute: '/',
      ),
    );
  }
}
