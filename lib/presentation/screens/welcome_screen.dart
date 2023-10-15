import 'package:flutter/material.dart';

import '../widgets/welcome_page_view.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome_screen';

  final List<String> _imagePages = const [
    'assets/images/healthy_lifestyle.png',
    'assets/images/working_out.png',
    'assets/images/activity_tracker.png',
  ];
  final List<String> _titlePages = const [
    'Welcome to Fitupia',
    'Your personal fitness Companion',
    'Nutrition made easy',
  ];
  final List<String> _descriptionPages = const [
    'Personalized fitness and nutrition guidance',
    'Recommending food and exercises based on your profile. Create a daily fitness routine',
    'Track your food intake and get personalized meal plans',
  ];

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
            itemCount: _imagePages.length,
            itemBuilder: (_, index) {
              return WelcomePageView(
                imagePath: _imagePages[index],
                title: _titlePages[index],
                description: _descriptionPages[index],
              );
            }),
      ),
    );
  }
}
