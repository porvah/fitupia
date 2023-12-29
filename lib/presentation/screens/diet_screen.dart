import 'package:first_app/presentation/screens/daily_intakes_screen.dart';
import 'package:first_app/presentation/widgets/calories_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/formulas.dart';
import '../../logic/read_meal_cubit/read_meal_cubit.dart';
import '../../logic/registration_cubit/registration_cubit.dart';
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
  late int allCal;
  late Map<String, int> dri;

  @override
  void initState() {
    super.initState();

    var userCubit = BlocProvider.of<RegistrationCubit>(context);
    var user = userCubit.curUser;

    allCal = Formulas.getAllCalories(user);
    dri = Formulas.getDRI(user);
  }

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
          CaloriesStats(bmr: allCal, dri: dri),
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
