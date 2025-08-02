import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final FormFieldValidator<String>? validator;

  MyTextFormField({
    super.key,
    required this.hintText,
    this.obscure = false,
    this.validator,
    required this.controller,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          hintText: hintText,
          hintStyle: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: Colors.grey.shade500),
        ),
        obscureText: obscure,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
