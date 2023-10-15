import 'package:flutter/material.dart';

import '../widgets/welcome_page_view.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome_screen';

  final List<String> _imagePages = const [
    'assets/images/healthy_lifestyle.png',
    'assets/images/activity_tracker.png',
    'assets/images/working_out.png',
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
                title: 'title',
                description: 'description',
              );
            }),
      ),
    );
  }
}
