import 'package:first_app/presentation/screens/meals_screen.dart';
import '../screens/encyclopedia_screen.dart';
import '../screens/food_screen.dart';
import '../../models/card_content.dart';

List<CardContent> handbookCards = const [
  CardContent(
    name: 'List of ingredients and\ncalorie count',
    imgPath: 'assets/images/diet/food.png',
    routeName: FoodScreen.routeName,
  ),
  CardContent(
    name: 'Sports nutrition and\nvitamin',
    imgPath: 'assets/images/diet/nutrition3.png',
    routeName: MealsScreen.routeName,
  ),
  CardContent(
    name: 'Drinks',
    imgPath: 'assets/images/diet/drinks1.png',
    routeName: MealsScreen.routeName,
  ),
  // CardContent(
  //   name: 'Encyclopedia',
  //   imgPath: 'assets/images/diet/encyclopedia1.png',
  //   routeName: EncyclopediaScreen.routeName,
  // ),
];
