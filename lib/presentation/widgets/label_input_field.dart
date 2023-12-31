import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class LabelInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final String? Function(String?)? validateInput;
  final Widget? icon;
  final Color? color;
  final Color? textColor;
  final bool readonly;

  const LabelInputField({
    super.key,
    required this.title,
    required this.hintText,
    this.textEditingController,
    this.textInputType,
    this.validateInput,
    this.icon,
    this.color,
    this.textColor,
    this.readonly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getTitle(context),
        CustomInputField(
          hintText: hintText,
          textEditingController: textEditingController,
          textInputType: textInputType,
          validateInput: validateInput,
          icon: icon,
          readonly: readonly,
          color: color,
        ),
      ],
    );
  }

  Widget _getTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: textColor ?? const Color.fromARGB(255, 2, 106, 154),
        ),
      ),
    );
  }
}
