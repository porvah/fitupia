import 'package:first_app/presentation/screens/dummy_screen.dart';

import '../../models/card_content.dart';

List<CardContent> handbookCards = const [
  CardContent(
    name: 'List of ingredients and\ncalorie count',
    imgPath: 'assets/images/diet/food.png',
    routeName: DummyScreen.routeName,
  ),
  CardContent(
    name: 'Sports nutrition and\nvitamin',
    imgPath: 'assets/images/diet/nutrition3.png',
    routeName: DummyScreen.routeName,
  ),
  CardContent(
    name: 'Drinks',
    imgPath: 'assets/images/diet/drinks1.png',
    routeName: DummyScreen.routeName,
  ),
  CardContent(
    name: 'encyclopedia',
    imgPath: 'assets/images/diet/encyclopedia1.png',
    routeName: DummyScreen.routeName,
  ),
];
