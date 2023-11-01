import 'package:flutter/material.dart';
import '../size_config/size_config.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String imgPath;
  final String screenName;

  const HomeCard({
    required this.title,
    required this.imgPath,
    required this.screenName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(screenName);
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
      imgPath,
      fit: BoxFit.cover,
    );
  }

  Container _buildTitle() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black.withOpacity(0.5),
      child: Text(
        title,
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
