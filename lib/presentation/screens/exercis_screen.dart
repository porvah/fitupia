import 'package:first_app/models/card_content.dart';
import 'package:first_app/presentation/screens/offline_screen.dart';
import 'package:first_app/presentation/widgets/exercis_of_bodypart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class ExerciseScreen extends StatelessWidget {
  final List<dynamic> data;
  final CardContent card;
  const ExerciseScreen({super.key, required this.data, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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

  ListView _onlineScreen() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) =>
          ExerciseOfBodyPartCard(data: data[index], card: card),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFBED8ED),
      leading: const BackButton(
        color: Color(0xFF455766),
      ),
      title: Text(
        card.name,
        style: const TextStyle(
          color: Color(0xFF455766),
        ),
      ),
    );
  }

  Widget _loadingScreen() {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFF455766)),
    );
  }
}
