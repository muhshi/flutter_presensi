import 'package:flutter/material.dart';

class DialogHelper {
  static showSnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  static showAlertDialog(
      {required BuildContext context, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
          );
        });
  }
}
