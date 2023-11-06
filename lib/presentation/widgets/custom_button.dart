import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? color;
  final double? fontSize;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomButton({
    required this.title,
    this.backgroundColor,
    this.color,
    this.fontSize,
    required this.onPressed,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: backgroundColor,
        foregroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
