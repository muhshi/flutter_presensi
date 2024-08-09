import 'package:flutter/material.dart';
import 'package:presensi/core/helper/global_helper.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function()? onPressedDefaultButton;
  final FilledButton? alternativeButton;
  const ErrorAppWidget(
      {super.key,
      required this.description,
      required this.onPressedDefaultButton,
      this.alternativeButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              description,
              style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.HEADLINE_SMALL),
            ),
            SizedBox(
              height: 30,
            ),
            alternativeButton ??
                FilledButton.icon(
                  onPressed: onPressedDefaultButton,
                  icon: Icon(Icons.refresh),
                  label: Text("Refresh"),
                ),
          ],
        ),
      ),
    );
  }
}
