import 'package:flutter/material.dart';

import '../utils/extensions/build_context.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog._({
    this.title,
    this.message,
    this.onOk,
  });

  final String? title;
  final String? message;
  final VoidCallback? onOk;

  static Future<void> show({
    required BuildContext context,
    String? title,
    String? message,
    VoidCallback? onOk,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return ErrorDialog._(
          title: title,
          message: message,
          onOk: onOk,
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
          onPressed: () {
            context.navigator.pop();
            if (onOk != null) onOk!();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
