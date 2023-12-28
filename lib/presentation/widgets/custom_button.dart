import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? color;
  final double? fontSize;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool loading;

  const CustomButton({
    required this.title,
    this.backgroundColor,
    this.color,
    this.fontSize,
    required this.onPressed,
    this.icon,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: loading ? () {} : onPressed,
      icon: Icon(loading ? null : icon),
      label: (loading) ? _buildLoading() : _buildContent(),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: backgroundColor,
        foregroundColor: color,
        padding: const EdgeInsets.all(12),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _buildContent() {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
