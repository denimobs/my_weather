import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordFormField extends HookWidget {
  const PasswordFormField({
    super.key,
    this.initialValue,
    this.controller,
    this.hintText,
    this.labelText,
    this.validator,
    this.prefixIcon,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    final obscure = useState(true);

    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure.value,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          onPressed: () => obscure.value = !obscure.value,
          icon: Icon(obscure.value ? Icons.cloudy_snowing : Icons.sunny),
        ),
      ),
    );
  }
}
