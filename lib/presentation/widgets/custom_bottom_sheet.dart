import 'package:first_app/logic/add_meal_cubit/add_meal_cubit.dart';
import 'package:first_app/logic/formulas.dart';
import 'package:first_app/logic/read_meal_cubit/read_meal_cubit.dart';
import 'package:first_app/logic/read_user_cubit/read_user_cubit.dart';
import 'package:first_app/presentation/widgets/custom_button.dart';
import 'package:first_app/presentation/widgets/label_input_field.dart';
import 'package:first_app/presentation/widgets/show_snack_bar_messenger.dart';
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
  final GlobalKey<FormState> _globalKey = GlobalKey();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

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
    return Form(
      key: _globalKey,
      autovalidateMode: _autoValidateMode,
      child: LabelInputField(
        title: "Weight in grams",
        hintText: 'Grams',
        readonly: false,
        textEditingController: controlGrams,
        textInputType: TextInputType.number,
        color: Colors.green,
        textColor: Colors.black,
        validateInput: _validateInput,
      ),
    );
  }

  String? _validateInput(String? val) {
    if (val == null) {
      return "Field can't be empty";
    }

    try {
      double newVal = double.parse(val);
      if (newVal <= 0) {
        return "Weight must be greater than zero";
      }
    } catch (e) {
      return "Weight must be number";
    }
    return null;
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
    if (!_globalKey.currentState!.validate()) {
      _autoValidateMode = AutovalidateMode.always;
      return;
    }

    MealModel finalMealModel = _getMeal();
    var mealCubit = BlocProvider.of<AddMealCubit>(context);
    var readMealCubit = BlocProvider.of<ReadMealCubit>(context);
    var userData = BlocProvider.of<ReadUserCubit>(context).userData!;

    var allCal = Formulas.getAllCalories(userData);
    var dri = Formulas.getDRI(userData);

    String? checkExceeding = readMealCubit.isMealExceeding(
      finalMealModel,
      allCal,
      dri,
    );

    if (checkExceeding != null) {
      _warnExceeding(
          context, checkExceeding, mealCubit, readMealCubit, finalMealModel);
    } else {
      await _addMeal(mealCubit, readMealCubit, finalMealModel);
    }
  }

  Future<void> _addMeal(
    AddMealCubit mealCubit,
    ReadMealCubit readMealCubit,
    MealModel meal,
  ) async {
    var nav = Navigator.of(context);
    var scaf = ScaffoldMessenger.of(context);

    await mealCubit.addMeal(meal);

    if (mealCubit.state is AddMealStateSuccess) {
      showSnackBarMessenger(scaf, 'Meal added successfully', Colors.green);
      readMealCubit.getMeals();
    } else if (mealCubit.state is AddMealStateFailure) {
      showSnackBarMessenger(scaf, 'An error occurred', Colors.red[700]!);
    }

    nav.pop();
  }

  void _warnExceeding(
    BuildContext context,
    String exceeded,
    AddMealCubit mealCubit,
    ReadMealCubit readMealCubit,
    MealModel finalMealModel,
  ) {
    showDialog(
        context: context,
        builder: (ctx) => _buildWarningDialog(
              ctx,
              exceeded,
              mealCubit,
              readMealCubit,
              finalMealModel,
            ));
  }

  Widget _buildWarningDialog(
    BuildContext context,
    String exceeded,
    AddMealCubit mealCubit,
    ReadMealCubit readMealCubit,
    MealModel finalMealModel,
  ) {
    return AlertDialog(
      title: const Text(
        'Warning',
        style: TextStyle(fontSize: 22, color: Colors.red),
      ),
      content: Text(
        'Exceeding the daily limit of $exceeded',
        style: const TextStyle(fontSize: 18),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () async {
            var nav = Navigator.of(context);
            await _addMeal(mealCubit, readMealCubit, finalMealModel);
            nav.pop();
          },
          child: Text('Add anyway', style: TextStyle(color: Colors.red[700])),
        ),
      ],
    );
  }

  double getGrams() {
    double res = double.tryParse(controlGrams.text) ?? 0;
    if (res < 0) res = 0;
    return res;
  }

  MealModel _getMeal() {
    MealModel meal = widget.meal;
    double grams = getGrams();

    return MealModel(
      name: meal.name,
      cals: _getCalories(),
      weight: grams,
      protein: _getProtien(),
      carbs: _getCarbs(),
      fat: _getFat(),
      fibers: _getFibers(),
    );
  }

  double _getCalories() {
    double grams = getGrams();
    return (grams / widget.meal.weight) * widget.meal.cals;
  }

  double _getProtien() {
    double grams = getGrams();
    return (grams / widget.meal.weight) * widget.meal.protein;
  }

  double _getCarbs() {
    double grams = getGrams();
    return (grams / widget.meal.weight) * widget.meal.carbs;
  }

  double _getFat() {
    double grams = getGrams();
    return (grams / widget.meal.weight) * widget.meal.fat;
  }

  double _getFibers() {
    double grams = getGrams();
    return (grams / widget.meal.weight) * widget.meal.fibers;
  }
}
