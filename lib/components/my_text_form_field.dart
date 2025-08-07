import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final FormFieldValidator<String>? validator;

  const MyTextFormField({
    super.key,
    required this.hintText,
    this.obscure = false,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      obscureText: obscure,
      controller: controller,
      validator: validator,
    );
  }
}
