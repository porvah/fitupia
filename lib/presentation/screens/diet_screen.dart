import 'package:first_app/models/nutrition_model.dart';
import 'package:first_app/presentation/screens/daily_intakes_screen.dart';
import 'package:first_app/presentation/widgets/calories_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../logic/formulas.dart';
import '../../logic/read_meal_cubit/read_meal_cubit.dart';
import '../../logic/read_user_cubit/read_user_cubit.dart';
import '../../models/user_data.dart';
import '../helper/helper.dart';
import '../size_config/size_config.dart';
import 'notebook_screen.dart';
import '../themes/appbar.dart';
import '../widgets/custom_button.dart';

class DietScreen extends StatefulWidget {
  static const String routeName = '/diet_screen';

  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  int BMR = 1;
  Map<String, int> DRI = {
    'Protein': 1,
    'Fats': 1,
    'Carbs': 1,
    'Water': 1,
    'Fiber': 1
  };
  void getBMR() async {
    var user = BlocProvider.of<ReadUserCubit>(context).userData;
    // Box<UserData> userBox = await Hive.openBox<UserData>(kUserBox);
    // UserData? user = userBox.getAt(0);
    setState(() {
      BMR = Formulas.getBMR(user!);
      DRI = Formulas.getDRI(user!);
    });
  }

  @override
  void initState() {
    getBMR();
    super.initState();
  }

  final List<NutritionModel> nutritions = const [
    NutritionModel(
      title: 'Fat',
      current: 42,
      target: 50,
      color: Colors.amber,
    ),
    NutritionModel(
      title: 'Proteins',
      current: 70,
      target: 200,
      color: Color.fromRGBO(211, 47, 47, 1),
    ),
    NutritionModel(
      title: 'Carbs',
      current: 92,
      target: 150,
      color: Colors.purple,
    ),
    NutritionModel(
      title: 'Fibers',
      current: 9,
      target: 40,
      color: Color.fromRGBO(21, 101, 192, 1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReadMealCubit>(context).getMeals();
    return Scaffold(
      appBar: buildAppBar(
        'Diet',
        Colors.white70,
        const Color.fromRGBO(234, 141, 11, 1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CaloriesStats(BMR: BMR, DRI: DRI),
          SizedBox(height: SizeConfig.getProportionateScreenHeight(60)),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          title: 'Daily Intakes',
          onPressed: () {
            Navigator.of(context).pushNamed(DailyIntakesScreen.routeName);
          },
          icon: Icons.dinner_dining,
          color: Colors.white,
          backgroundColor: const Color.fromRGBO(234, 141, 11, 1),
          fontSize: 18,
        ),
        CustomButton(
          title: 'Add Meal',
          onPressed: () {
            Navigator.of(context).pushNamed(NoteBookScreen.routeName);
          },
          icon: Icons.add,
          color: Colors.white,
          backgroundColor: Colors.redAccent,
          fontSize: 18,
        ),
      ],
    );
  }
}
