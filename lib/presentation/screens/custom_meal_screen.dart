import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/label_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/add_meal_cubit/add_meal_cubit.dart';
import '../../logic/read_meal_cubit/read_meal_cubit.dart';
import '../widgets/custom_button.dart';
import '../widgets/show_snack_bar_messenger.dart';

class CustomMealScreen extends StatefulWidget {
  static const String routeName = '/custom_meal_screen';

  const CustomMealScreen({super.key});

  @override
  State<CustomMealScreen> createState() => _CustomMealScreenState();
}

class _CustomMealScreenState extends State<CustomMealScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _weightController = TextEditingController();

  final TextEditingController _calsController = TextEditingController();

  final TextEditingController _proteinController = TextEditingController();

  final TextEditingController _carbController = TextEditingController();

  final TextEditingController _fatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Custom Meal', Colors.white, Colors.green),
      body: Form(
        key: _globalKey,
        autovalidateMode: _autovalidateMode,
        child: ListView(
          children: [
            LabelInputField(
              title: 'Meal name',
              hintText: 'Enter the meal name',
              color: Colors.green,
              textColor: const Color.fromARGB(255, 6, 154, 11),
              textEditingController: _nameController,
              validateInput: _validateText,
            ),
            LabelInputField(
              title: 'Weight',
              hintText: 'Enter the weight in grams',
              color: Colors.green,
              textColor: const Color.fromARGB(255, 6, 154, 11),
              textInputType: TextInputType.number,
              textEditingController: _weightController,
              validateInput: _validateDouble,
            ),
            LabelInputField(
              title: 'Calories',
              hintText: 'Enter the amount of calories',
              color: Colors.green,
              textColor: const Color.fromARGB(255, 6, 154, 11),
              textInputType: TextInputType.number,
              textEditingController: _calsController,
              validateInput: _validateDouble,
            ),
            LabelInputField(
              title: 'Protein',
              hintText: 'Enter the amount of protein in grams',
              color: Colors.green,
              textColor: const Color.fromARGB(255, 6, 154, 11),
              textInputType: TextInputType.number,
              textEditingController: _proteinController,
              validateInput: _validateDouble,
            ),
            LabelInputField(
              title: 'Carbs',
              hintText: 'Enter the amount of carbs in grams',
              color: Colors.green,
              textColor: const Color.fromARGB(255, 6, 154, 11),
              textInputType: TextInputType.number,
              textEditingController: _carbController,
              validateInput: _validateDouble,
            ),
            LabelInputField(
              title: 'Fat',
              hintText: 'Enter the amount of fat in grams',
              color: Colors.green,
              textColor: const Color.fromARGB(255, 6, 154, 11),
              textInputType: TextInputType.number,
              textEditingController: _fatController,
              validateInput: _validateDouble,
            ),
            _buildButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
              title: 'Add',
              onPressed: _onSubmit,
              icon: Icons.add,
              color: Colors.white,
              backgroundColor: Colors.green,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSubmit() async {
    if (!_globalKey.currentState!.validate()) {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
      return;
    }

    var nav = Navigator.of(context);
    var scaf = ScaffoldMessenger.of(context);

    MealModel finalMealModel = _getMeal();
    var mealCubit = BlocProvider.of<AddMealCubit>(context);
    var readMealCubit = BlocProvider.of<ReadMealCubit>(context);

    await mealCubit.addMeal(finalMealModel);

    if (mealCubit.state is AddMealStateSuccess) {
      showSnackBarMessenger(scaf, 'Meal added successfully', Colors.green);
      readMealCubit.getMeals();
    } else if (mealCubit.state is AddMealStateFailure) {
      showSnackBarMessenger(scaf, 'An error occurred', Colors.red[700]!);
    }

    nav.pop();
  }

  MealModel _getMeal() {
    String name = _nameController.text;
    double weight = double.parse(_weightController.text);
    double cals = double.parse(_calsController.text);
    double protein = double.parse(_proteinController.text);
    double carbs = double.parse(_carbController.text);
    double fat = double.parse(_fatController.text);

    MealModel mealModel = MealModel(
      name: name,
      cals: cals,
      weight: weight,
      protein: protein,
      carbs: carbs,
      fat: fat,
      fibers: 0.0,
    );

    return mealModel;
  }

  String? _validateText(String? val) {
    if (val == null || val.isEmpty) {
      return "Field can't be empty";
    }
    return null;
  }

  String? _validateDouble(String? val) {
    if (val == null) {
      return "Field can't be empty";
    }

    try {
      double newVal = double.parse(val);
      if (newVal < 0) {
        return "Field must be a positive number";
      }
    } catch (e) {
      return "Field must be number";
    }
    return null;
  }
}
