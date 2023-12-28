import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:flutter/material.dart';

void showSnackBarContext(
  BuildContext context,
  String title,
  Color color, {
  String? imgPath,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.white.withOpacity(0),
      content: Container(
        padding: const EdgeInsets.all(16),
        height: 90,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imgPath != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  imgPath,
                  color: Colors.white,
                ),
              ),
            if (imgPath != null)
              SizedBox(
                width: SizeConfig.getProportionateScreenWidth(30),
              ),
            SizedBox(
              width: SizeConfig.screenWidth * .5,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "KoHo",
                  color: Colors.white,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
