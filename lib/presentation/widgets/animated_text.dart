import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String title;
  final Animation<Offset> slideAnimation;

  const AnimatedText({
    required this.title,
    required this.slideAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, _) => SlideTransition(
        position: slideAnimation,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
