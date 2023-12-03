import 'package:first_app/logic/add_meal_cubit/add_meal_cubit.dart';
import 'package:first_app/logic/read_meal_cubit/read_meal_cubit.dart';
import 'package:first_app/presentation/widgets/custom_button.dart';
import 'package:first_app/presentation/widgets/label_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/meal_model.dart';
import '../size_config/size_config.dart';

class CustomBottomSheet extends StatefulWidget {
  final MealModel meal;

  const CustomBottomSheet({required this.meal, super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late TextEditingController controlGrams;

  @override
  void initState() {
    super.initState();
    controlGrams = TextEditingController(text: widget.meal.weight.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          16 + MediaQuery.of(context).viewInsets.bottom,
        ),
        width: SizeConfig.screenWidth,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(215, 204, 200, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const Divider(
          thickness: 2,
          color: Colors.black54,
        ),
        _buildCalories(),
        _buildNutritions(),
        const SizedBox(height: 12),
        _buildInputField(),
        const SizedBox(height: 12),
        _buildButtons(),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.meal.name,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  Widget _buildCalories() {
    return Row(
      children: [
        const Spacer(),
        const Icon(
          Icons.local_fire_department_sharp,
          color: Colors.amber,
          size: 40,
        ),
        Text(
          '${_getCalories().toStringAsFixed(1)} cal',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildNutritions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildNut('Protein', _getProtien(), Colors.green),
        _buildNut('Carbs', _getCarbs(), Colors.amber),
        _buildNut('Fat', _getFat(), Colors.purple),
      ],
    );
  }

  Widget _buildNut(String title, double value, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          children: [
            Text(
              value.toStringAsFixed(1),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputField() {
    return LabelInputField(
      title: "Weight in grams",
      hintText: 'Grams',
      readonly: false,
      textEditingController: controlGrams,
      textInputType: TextInputType.number,
      color: Colors.green,
      textColor: Colors.black,
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            title: 'Cancel',
            onPressed: () => Navigator.of(context).pop(),
            icon: Icons.cancel,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: CustomButton(
            title: 'Save',
            onPressed: _onSaveMeal,
            icon: Icons.add,
            color: Colors.white,
            backgroundColor: Colors.green,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Future<void> _onSaveMeal() async {
    var nav = Navigator.of(context);
    var scaf = ScaffoldMessenger.of(context);

    MealModel finalMealModel = _getMeal();
    var mealCubit = BlocProvider.of<AddMealCubit>(context);
    var readMealCubit = BlocProvider.of<ReadMealCubit>(context);

    await mealCubit.addMeal(finalMealModel);

    if (mealCubit.state is AddMealStateSuccess) {
      _showSnackBar(scaf, 'Meal added successfully', Colors.green);
      readMealCubit.getMeals();
    } else if (mealCubit.state is AddMealStateFailure) {
      _showSnackBar(scaf, 'An error occurred', Colors.red[700]!);
    }

    nav.pop();
  }

  MealModel _getMeal() {
    MealModel meal = widget.meal;
    double grams = double.parse(controlGrams.text);

    return MealModel(
      name: meal.name,
      cals: _getCalories(),
      weight: grams,
      protein: _getProtien(),
      carbs: _getCarbs(),
      fat: _getFat(),
    );
  }

  double _getCalories() {
    double grams = double.parse(controlGrams.text);
    return (grams / widget.meal.weight) * widget.meal.cals;
  }

  double _getProtien() {
    double grams = double.parse(controlGrams.text);
    return (grams / widget.meal.weight) * widget.meal.protein;
  }

  double _getCarbs() {
    double grams = double.parse(controlGrams.text);
    return (grams / widget.meal.weight) * widget.meal.carbs;
  }

  double _getFat() {
    double grams = double.parse(controlGrams.text);
    return (grams / widget.meal.weight) * widget.meal.fat;
  }

  void _showSnackBar(
      ScaffoldMessengerState messengerState, String msg, Color color) {
    messengerState.showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1500),
        content: Text(
          msg,
          style: TextStyle(color: color, fontSize: 16),
        ),
      ),
    );
  }
}
