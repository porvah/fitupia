import 'package:first_app/models/card_content.dart';
import 'package:first_app/models/exercises_of_bodypart_API.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:first_app/presentation/widgets/exercis_of_bodypart_card.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'offline_screen.dart';

class PlanScreen extends StatelessWidget {
  final card = const CardContent(
      name: 'Exercise', imgPath: 'assets/images/exercises/chest.png');

  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getRecommendation(context);
    SizeConfig.init(context);
    return Scaffold(
      appBar: buildAppBar('Today\'s Plan', Colors.white,
          const Color.fromARGB(255, 17, 86, 142)),
      body: OfflineBuilder(
        connectivityBuilder: (context, value, child) {
          final bool connected = value != ConnectivityResult.none;

          if (connected) {
            return _onlineScreen();
          } else {
            return const OfflineScreen();
          }
        },
        child: _loadingScreen(),
      ),
    );
  }

  Widget _onlineScreen() {
    if (recommendation.isEmpty) {
      return const Center(
          child: Text(
        'It\'s your free day.',
        style: TextStyle(
          color: Color(0xFF455766),
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ));
    }
    return ListView.builder(
      itemCount: recommendation.length,
      itemBuilder: (context, index) =>
          ExerciseOfBodyPartCard(data: recommendation[index], card: card),
    );
  }

  Widget _loadingScreen() {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFF455766)),
    );
  }
}
