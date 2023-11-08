import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:flutter/material.dart';

class ExercisOfBodyPartCard extends StatelessWidget {
  final CardContent card;
  const ExercisOfBodyPartCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(7.0),
        height: SizeConfig.screenHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFFecf3fa)
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(7.0),
              width: SizeConfig.screenWidth * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                      image: AssetImage(card.imgPath), fit: BoxFit.fill)),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: _getText(),
              ),
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.swap_horizontal_circle_sharp))
          ],
        ),
      ),
    );
  }

  Text _getText() {
    return Text(
      card.name,
      style: TextStyle(
        letterSpacing: 1.0,
        fontSize: SizeConfig.getProportionateScreenWidth(20),
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
