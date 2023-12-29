import 'package:first_app/presentation/themes/appbar.dart';
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final String name;
  final Map<String, dynamic> data;

  const ExerciseDetailsScreen({
    required this.name,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          data['name'],
          Colors.white,
          const Color.fromARGB(255, 155, 187, 213),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              _buildImage(),
              _buildCard(
                'Target: ',
                [data['target']],
                const Color.fromARGB(255, 203, 91, 83),
              ),
              _buildCard(
                'Body Part: ',
                [data['bodyPart']],
                const Color.fromARGB(255, 16, 183, 138),
              ),
              _buildCard(
                'Equipment: ',
                [data['equipment']],
                const Color.fromARGB(255, 50, 76, 161),
              ),
              _buildCard(
                'Secondary Muscles',
                (data['secondaryMuscles'] as List)
                    .map((e) => e as String)
                    .toList(),
                const Color.fromARGB(255, 136, 136, 22),
              ),
              _buildCard(
                  'Instructions',
                  (data['instructions'] as List)
                      .map((e) => e as String)
                      .toList(),
                  Colors.grey),
            ],
          ),
        ));
  }

  Widget _buildImage() {
    return Hero(
      tag: data['id'],
      child: SizedBox(
        // height: SizeConfig.screenHeight * 0.3,
        child: Image.network(
          data['gifUrl'],
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<String> value, Color color) {
    return Container(
      width: SizeConfig.screenWidth,
      // height: 70,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildtTitle(title),
          ...value.map((e) => _buildSingleValue(e)).toList(),
        ],
      ),
    );
  }

  Padding _buildSingleValue(String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        '- $value',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Text _buildtTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
