import 'package:flutter/material.dart';

void showSnackBarMessenger(
    ScaffoldMessengerState messengerState, String msg, Color color) {
  messengerState.showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(
        msg,
        style: TextStyle(color: color, fontSize: 16),
      ),
    ),
  );
}
