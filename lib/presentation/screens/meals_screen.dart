import 'package:first_app/models/meal_model.dart';
import 'package:first_app/presentation/widgets/meal_widget.dart';
import 'package:flutter/material.dart';

import '../helper/meals.dart';
import '../widgets/custom_bottom_sheet.dart';

class MealsScreen extends StatefulWidget {
  static const String routeName = '/meals_screen';
  final int toBeDisplayedList;

  const MealsScreen(this.toBeDisplayedList, {super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  final pagenameList = const [
    'Dairy product',
    'Meats and beef',
    'Fish',
    'Vegetables',
    'Bread and flour',
    'Nuts and seeds',
    'Drinks'
  ];
  bool isSearching = false;
  final TextEditingController _controller = TextEditingController();
  late List<MealModel> curMeals;

  @override
  void initState() {
    super.initState();
    curMeals = meals[widget.toBeDisplayedList];
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching ? _buildSearchAppBar() : _buildDefaultAppBar(context),
      body: SafeArea(
        child: ListView.builder(
          itemCount: curMeals.length,
          itemBuilder: (ctx, index) {
            return MealWidget(
              mealModel: curMeals[index],
              buttonTitle: 'Add',
              icon: Icons.add,
              onPressed: () => _openBottomSheet(context, curMeals[index]),
            );
          },
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context, MealModel mealModel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return CustomBottomSheet(meal: mealModel);
      },
    );
  }

  AppBar _buildDefaultAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      title: Text(
        pagenameList[widget.toBeDisplayedList],
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      title: _buildTextField(),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for meal',
        hintStyle: TextStyle(color: Colors.white54, fontSize: 18),
      ),
      cursorColor: Colors.white,
      autofocus: true,
      enableSuggestions: true,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: _onChange,
    );
  }

  void _onChange(String val) {
    List<MealModel> newMeals = meals[widget.toBeDisplayedList]
        .where((e) => e.name.contains(val))
        .toList();

    setState(() {
      curMeals = newMeals;
    });
  }

  void _startSearching() {
    setState(() {
      ModalRoute.of(context)!.addLocalHistoryEntry(
        LocalHistoryEntry(onRemove: _stopSearching),
      );
      isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      curMeals = meals[widget.toBeDisplayedList];
      isSearching = false;
      _controller.clear();
    });
  }
}
