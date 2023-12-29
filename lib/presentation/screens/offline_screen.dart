import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No internet connection!',
            style: TextStyle(
                color: Color.fromARGB(255, 14, 162, 115),
                fontWeight: FontWeight.bold,
                fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Please check your internet.',
            style: TextStyle(
                color: Color.fromARGB(255, 15, 147, 85),
                fontWeight: FontWeight.bold,
                fontSize: 18),
            textAlign: TextAlign.center,
          ),
          Image.asset(
            'assets/images/no_internet.png',
            fit: BoxFit.cover,
            width: SizeConfig.screenWidth,
          ),
        ],
      ),
    );
  }
}
