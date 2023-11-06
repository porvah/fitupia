import 'package:first_app/models/card_content.dart';
import 'package:flutter/material.dart';
import '../size_config/size_config.dart';

class HomeCard extends StatelessWidget {
  final CardContent card;

  const HomeCard({
    required this.card,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (card.routeName != null) {
          Navigator.of(context).pushNamed(card.routeName!);
        }
      },
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.35,
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: GridTile(
            footer: _buildTitle(),
            child: _buildImage(),
          ),
        ),
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(
      card.imgPath,
      fit: BoxFit.cover,
    );
  }

  Container _buildTitle() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black.withOpacity(0.5),
      child: Text(
        card.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: SizeConfig.getProportionateScreenWidth(22),
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
