import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String error) {
  Navigator.of(context, rootNavigator: true).pop();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font12StoneGrayMeduim,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14PrimarySemiBold,
            ),
          ),
        ],
      );
    },
  );
}
