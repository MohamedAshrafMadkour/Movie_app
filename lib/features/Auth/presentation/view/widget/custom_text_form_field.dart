import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.onPressed,
    this.isObscure,
    this.icon,
    this.onSaved,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final void Function()? onPressed;
  final bool? isObscure;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter this field';
        }
        return null;
      },

      obscureText: isObscure ?? false,
      keyboardType: keyboardType,
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        suffixIcon: icon,
        suffixIconColor: const Color(0xFFBDBDBD),
        hintText: hintText,
        hintStyle: Styles.textRegular12.copyWith(
          color: const Color(0xFF7D7E83),
        ),
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
