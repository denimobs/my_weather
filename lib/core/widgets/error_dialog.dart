import 'package:flutter/material.dart';

import '../utils/extensions/build_context.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog._({
    this.title,
    this.message,
  });

  final String? title;
  final String? message;

  static Future<void> show({
    required BuildContext context,
    String? title,
    String? message,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return ErrorDialog._(
          title: title,
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget? title_;
    if (title != null) {
      title_ = Text(title!);
    }

    Widget? message_;
    if (message != null) {
      message_ = Text(message!);
    }

    return AlertDialog(
      title: title_,
      content: message_,
      actions: [
        TextButton(
          onPressed: () => context.navigator.pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
