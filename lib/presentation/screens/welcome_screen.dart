import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/welcome_page_view.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildPageView(),
            SmoothPageIndicator(
              controller: _pageController,
              count: _imagePages.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Color(0xFFc1121f),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imagePages.length,
        itemBuilder: (_, index) {
          return WelcomePageView(
            imagePath: _imagePages[index],
            title: _titlePages[index],
            description: _descriptionPages[index],
          );
        },
      ),
    );
  }
}
