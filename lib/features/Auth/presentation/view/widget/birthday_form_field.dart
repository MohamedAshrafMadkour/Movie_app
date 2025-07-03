import 'package:flutter/material.dart';

class BirthdayFormField extends StatelessWidget {
  const BirthdayFormField({
    super.key,
    this.onSaved,
    this.onTap,
    this.hintText,
    this.hintStyle,
    this.controller,
  });

  final FormFieldSetter<String>? onSaved;
  final Function()? onTap;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your birthday';
        }
        return null;
      },
      readOnly: true,
      onTap: onTap,
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        hintText: hintText ?? 'Birthday',
        hintStyle: hintStyle,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(width: 1, color: const Color(0xFFD9D9D9)),
    );
  }
}
