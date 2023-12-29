import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final String? Function(String?)? validateInput;
  final Widget? icon;
  final bool readonly;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.textEditingController,
    this.validateInput,
    this.textInputType,
    this.icon,
    required this.readonly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: TextFormField(
        controller: textEditingController,
        validator: validateInput,
        keyboardType: textInputType,
        readOnly: readonly,
        decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: _inputBorder(context),
          enabledBorder: _inputBorder(context),
        ),
        // style: GoogleFonts.robotoMono(color: _getTextColor(context)),
      ),
    );
  }

  OutlineInputBorder _inputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 2, 106, 154),
        width: 2.0,
      ),
    );
  }
}
