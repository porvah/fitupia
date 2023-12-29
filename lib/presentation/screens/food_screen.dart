import 'package:first_app/presentation/helper/foods_category.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/custom_listview.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  static const String routeName = '/food_screen';

  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Ingredients', Colors.white, Colors.blue),
      body: CustomListView(cards: foodsCategory),
    );
  }
}
